function mp3Embed(audioEmbedTag) {
    var src = audioEmbedTag.getAttribute( "src" );
    var caption = audioEmbedTag.getAttribute( "caption" );
    if(src.indexOf('.mp3') !== -1) {
        var srcParts = src.split('?');
        if(srcParts.length == 1) srcParts[1] = '';
        var unrecognizedParameterString = srcParts[1];
        unrecognizedParameterString = unrecognizedParameterString.replace('&','').replace('&','');
        unrecognizedParameterString = unrecognizedParameterString.replace('autoplay=1','').replace('autoplay=0','');
        unrecognizedParameterString = unrecognizedParameterString.replace('loop=1','').replace('loop=0','');
        unrecognizedParameterString = unrecognizedParameterString.replace('controls=0','').replace('controls=1','');

        if (srcParts[0].lastIndexOf('.mp3', srcParts[0].length - 4) === srcParts[0].length - 4 && unrecognizedParameterString.length == 0) {
            if(srcParts[1].indexOf('autoplay=1') !== -1) var autoplay=1; else var autoplay=0;
            if(srcParts[1].indexOf('loop=1') !== -1) var loop=1; else var loop=0;
            if(srcParts[1].indexOf('controls=0') !== -1) var controls=0; else var controls=1;
            var newInnerHTML = '<audio';
            if(autoplay==1) newInnerHTML += ' autoplay';
            if(loop==1) newInnerHTML += ' loop';
            if(controls==1) newInnerHTML += ' controls';
            newInnerHTML += '><source src="'+srcParts[0]+'" type="audio/mpeg">Your browser does not support the audio element, but here is <a href="' + srcParts[0] + '">a link.</a></audio>';
            if(caption) {
                newInnerHTML += `(${caption})`;
            }
            audioEmbedTag.innerHTML = newInnerHTML;
        }
    }
}

function fillAudioEmbeds() {
    var audioEmbedTags = document.querySelectorAll('.audioEmbed');
    audioEmbedTags.forEach(function (audioEmbedTag) {
        mp3Embed(audioEmbedTag);
    });
    document.addEventListener('play', function(e){
        var audios = document.getElementsByTagName('audio');
        for(var i = 0, len = audios.length; i < len;i++){
            if(audios[i] != e.target){
                audios[i].pause();
            }
        }
    }, true);
}

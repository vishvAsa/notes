+++
title = "Test"
+++

This is a test page for the [keyman pre-vedic sanskrit keyboard](../) and related keyboards.


<script src='https://s.keyman.com/kmw/engine/18.0.240/keymanweb.js'></script>
<script src='https://s.keyman.com/kmw/engine/18.0.240/kmwuitoggle.js'></script>

<!-- The textarea where you will type -->
<textarea id="myTextarea" rows="10" cols="80"></textarea>

<!-- The output display element -->
<h2>Typed Content:</h2>
<div id="output"></div>


<script>
  window.addEventListener('load', (event) => {
    var ready = keyman.init({attachType:'auto'});
    Promise.resolve(ready).then(() => {
      // allSettled: a cloud-keyboard failure must not block the local keyboards.
      return Promise.allSettled([
        keyman.addKeyboards('@en'), // Loads default English keyboard from Keyman Cloud (CDN)
        keyman.addKeyboards('@th'), // Loads default Thai keyboard from Keyman Cloud (CDN)
        keyman.addKeyboards({
          name: 'Pre-Vedic Sanskrit',
          id: 'optitrans_devanagari_sanskrit_pre_vedic',
          filename: '../optitrans_devanagari_sanskrit_pre_vedic.js',
          version: '1.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Kannada Sanskrit',
          id: 'optitrans_kannada_sanskrit',
          filename: '../optitrans_kannada_sanskrit.js',
          version: '1.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          },
          {
            name: 'Kannada',
            id: 'kn',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Telugu Sanskrit',
          id: 'optitrans_telugu_sanskrit',
          filename: '../optitrans_telugu_sanskrit.js',
          version: '1.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          },
          {
            name: 'Telugu',
            id: 'te',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Sanskrit ISO-15919',
          id: 'optitrans_iso15919_sanskrit',
          filename: '../optitrans_iso15919_sanskrit.js',
          version: '1.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Tamil Subscripted Sanskrit',
          id: 'optitrans_tamil_subscripted_sanskrit',
          filename: '../optitrans_tamil_subscripted_sanskrit.js',
          version: '1.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          },
          {
            name: 'Tamil',
            id: 'ta',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Vedic Sanskrit Devanagari Phonetic (ITRANS)',
          id: 'itrans_devanagari_sanskrit_vedic',
          filename: '../itrans_devanagari_sanskrit_vedic.js',
          version: '1.3.0',
          languages: [{
            name: 'Sanskrit',
            id: 'sa',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Hindi Devanagari Phonetic (ITRANS)',
          id: 'itrans_devanagari_hindi',
          filename: '../itrans_devanagari_hindi.js',
          version: '1.4.0',
          languages: [{
            name: 'Hindi',
            id: 'hi',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Odia/Oriya Phonetic (ITRANS)',
          id: 'itrans_odia',
          filename: '../itrans_odia.js',
          version: '1.1.1',
          languages: [{
            name: 'Oriya',
            id: 'or',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Gujarati Phonetic (ITRANS)',
          id: 'itrans_gujarati',
          filename: '../itrans_gujarati.js',
          version: '1.3.0',
          languages: [{
            name: 'Gujarati',
            id: 'gu',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Bengali Phonetic (ITRANS)',
          id: 'itrans_bengali',
          filename: '../itrans_bengali.js',
          version: '1.1.0',
          languages: [{
            name: 'Bengali',
            id: 'bn',
            region: 'as'
          }]
        }),
        keyman.addKeyboards({
          name: 'Gurmukhi Phonetic (ITRANS)',
          id: 'itrans_gurmukhi',
          filename: '../itrans_gurmukhi.js',
          version: '1.1',
          languages: [{
            name: 'Panjabi',
            id: 'pa',
            region: 'as'
          }]
        })
      ]);
    }).then((results) => {
      results.forEach((r) => { if (r.status === 'rejected') console.error(r.reason); });
      keyman.setActiveKeyboard('optitrans_devanagari_sanskrit_pre_vedic', 'sa');
    }).catch((e) => {
      console.error(e);
    });
    document.getElementById('myTextarea').addEventListener('input', (e) => {
      document.getElementById('output').textContent = e.target.value;
    });
  });
</script>

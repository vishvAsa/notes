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

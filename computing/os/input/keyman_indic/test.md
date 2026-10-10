+++
title = "Test"
+++

This is a test page for the [keyman pre-vedic sanskrit keyboard](../) and related keyboards.


<script src='https://s.keyman.com/kmw/engine/18.0.240/keymanweb.js'></script>
<script src='https://s.keyman.com/kmw/engine/18.0.240/kmwuitoggle.js'></script>

<!-- The textarea where you will type -->
<textarea id="myTextarea" rows="10" cols="80"></textarea>
<p><button id="btnCopy" type="button" title="Copy typed text">📋</button>
<span id="copyStatus" aria-live="polite"></span></p>

<!-- Keyboard switcher that works even when KeymanWeb's own toolbar refuses to
     load (it skips touch devices, and some desktop browsers wrongly report
     touch support, e.g. with a graphics tablet or iPad Sidecar attached). -->
<p>Keyboard: <select id="kbdSelect"><option value="">(loading…)</option></select></p>

<!-- The output display element (preserves newlines and wraps long lines) -->
<h2>Typed Content:</h2>
<div id="output" style="white-space: pre-wrap; overflow-wrap: break-word;"></div>


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
      refreshKbdSelect();
      keyman.setActiveKeyboard('optitrans_devanagari_sanskrit_pre_vedic', 'sa');
      refreshKbdSelect();
    }).catch((e) => {
      console.error(e);
    });
    // Keep the dropdown in sync when keyboards finish loading later.
    if (keyman.addEventListener) {
      keyman.addEventListener('keyboardregistered', () => refreshKbdSelect());
      keyman.addEventListener('keyboardchange', () => refreshKbdSelect());
    }
    function refreshKbdSelect() {
      var sel = document.getElementById('kbdSelect');
      if (!sel || typeof keyman.getKeyboards !== 'function') return;
      var kbs = keyman.getKeyboards() || [];
      var active = '';
      try { active = keyman.getActiveKeyboard() || ''; } catch (e) {}
      var html = '<option value="">(System keyboard)</option>';
      kbs.forEach((k) => {
        var id = k.InternalName || k.id || k.KI || '';
        var lang = k.LanguageCode || k.lang || '';
        var label = (k.LanguageName || lang) + ' - ' + (k.Name || id);
        var selAttr = (active && active.indexOf(id) === 0) ? ' selected' : '';
        html += '<option value="' + id + '@' + lang + '"' + selAttr + '>' + label + '</option>';
      });
      sel.innerHTML = html;
    }
    document.getElementById('kbdSelect').addEventListener('change', (e) => {
      var parts = (e.target.value || '').split('@');
      try {
        if (parts[0]) keyman.setActiveKeyboard(parts[0], parts[1] || '');
        else keyman.setActiveKeyboard('', '');
      } catch (err) { console.error(err); }
      refreshKbdSelect();
    });
    document.getElementById('myTextarea').addEventListener('input', (e) => {
      document.getElementById('output').textContent = e.target.value;
    });
    document.getElementById('btnCopy').addEventListener('click', async () => {
      var ta = document.getElementById('myTextarea');
      var status = document.getElementById('copyStatus');
      try {
        await navigator.clipboard.writeText(ta.value);
        status.textContent = 'Copied!';
      } catch (err) {
        // Fallback for non-secure contexts (plain http) where the async
        // clipboard API is unavailable.
        ta.focus();
        ta.select();
        try {
          var ok = document.execCommand('copy');
          status.textContent = ok ? 'Copied!' : 'Copy failed — select the text and press Ctrl+C/Cmd+C.';
        } catch (e2) {
          status.textContent = 'Copy failed — select the text and press Ctrl+C/Cmd+C.';
        }
      }
      window.setTimeout(() => { status.textContent = ''; }, 2000);
    });
  });
</script>

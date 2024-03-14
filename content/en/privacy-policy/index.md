---
title: "Privacy Policy"
description: "We do not use cookies and we do not collect any personal data."
date: 2020-08-27T19:23:18+02:00
lastmod: 2020-08-27T19:23:18+02:00
draft: false
images: []
---

__TLDR__: We do not use cookies and we do not collect any personal data.

## Website visitors

- No personal information is collected.
- No information is stored in the browser.
- No information is shared with, sent to or sold to third-parties.
- No information is shared with advertising companies.
- No information is mined and harvested for personal and behavioral trends.
- No information is monetized.

##  Matomo

Diese Website nutzt Matomo aus rein didaktisch-wissenschaftlichen Gründen.

<div id="optout-form">
  <p>You may choose not to have a unique web analytics cookie identification number assigned to your computer to avoid the aggregation and analysis of data collected on this website.</p>
  <p>To make that choice, please click below to receive an opt-out cookie.</p>

  <p>
    <input type="checkbox" id="optout" />
    <label for="optout"><strong></strong></label>
  </p>
</div>
<script>
document.addEventListener("DOMContentLoaded", function(event) {
  function setOptOutText(element) {
    _paq.push([function() {
      element.checked = !this.isUserOptedOut();
      document.querySelector('label[for=optout] strong').innerText = this.isUserOptedOut()
        ? 'You are currently opted out. Click here to opt in.'
        : 'You are currently opted in. Click here to opt out.';
    }]);
  }

  var optOut = document.getElementById("optout");
  optOut.addEventListener("click", function() {
    if (this.checked) {
      _paq.push(['forgetUserOptOut']);
    } else {
      _paq.push(['optUserOut']);
    }
    setOptOutText(optOut);
  });
  setOptOutText(optOut);
});
</script>
      

Effective Date: _14th March 2024_

function setInlineComments(htmlIn) {
  return htmlIn.replace(/\+\+\+(.+?)\+\+\+/g, "<span class=\"inline_comment\">$1</span>");
}

function setInlineCommentsInPostContent() {
  if ($("#post_content").length > 0) {
    // console.debug( $("#post_content").html);
    // console.log(setInlineComments($("#post_content").html()));
    $("#post_content").html(setInlineComments($("#post_content").html()));
  }
}

function onDocumentReadyTasks() {
  insertSidebarItems();
  // insertTopnavDropdownItems();
  // Update table of contents (To be called whenever page contents are updated).
  updateToc();
  setInlineCommentsInPostContent();
  fillAudioEmbeds();
  fillVideoEmbeds();
  // For unknown reasons, handleIncludes() called first does not work as well 201901 desktop.
  handleIncludes();
  setupDisqus();
}

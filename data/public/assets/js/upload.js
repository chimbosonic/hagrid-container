var body = document.getElementsByTagName("body")[0];

  body.addEventListener('dragover', function(e) {
    e.preventDefault();
    e.stopPropagation();
  }, false);

  body.addEventListener('drop', function(e) {
    e.preventDefault();
    e.stopPropagation();
    if (e.dataTransfer) {
      document.getElementById('keytext').files = e.dataTransfer.files;
    }
}, false);

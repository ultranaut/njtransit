<?php

class GTF {
  public $feedSource;
  public $dataFiles;
  function __construct($url) {
    $this->feedSource = $url;
    $this->dataFiles = $this->getData($url);
  }

  function getData($url) {
    copy($url, 'foo.zip');
    /* $fh = fopen($url, 'r'); */
    /* while (!feof($fh)) { */
    /*   echo fgets($fh); */
    /* } */
  }
}

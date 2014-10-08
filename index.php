<?php

include 'data/GTF.php';

$feed = new GTF('http://ultranaut.com/njt/rail_data.zip');

echo $feed->feedSource;

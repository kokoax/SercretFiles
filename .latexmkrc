#!/usr/bin/perl

$latex         = 'platex -shell-escape -syntax=1 -halt-on-error';
$latex_silent  = $latex . ' -interation=batchmode';
$bibtex        = 'pbibtex';
$dvipdf        = 'dvipdfmx %O -o %D %S';
$max_repeat    = 10;
$pdf_mode      = 3;
$pdf_previewer = '/usr/bin/evince';


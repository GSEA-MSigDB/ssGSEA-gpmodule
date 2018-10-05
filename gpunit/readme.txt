This folder contains the original output file that was used for the diff tests circa v9.0.10.

Because we are running in a docker container now, I expect the diff to be exact.
The diffs.txt shows the difference between the previous version and this one.

  $ diff \
      output-orig/P53_14samples_collapsed_symbols.PROJ.gct \
      output/P53_14samples_collapsed_symbols.PROJ.gct \
    >> diffs.txt

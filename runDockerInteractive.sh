#!/bin/bash
docker run -ti --rm -v /home/users/laderast/data/:/data -v /home/users/laderast/openCytoAML:/openCytoAML -v /home/users/laderast/janssenAnalysisResults/:/janssenAnalysisResults laderast/flowaml R

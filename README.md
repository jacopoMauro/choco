# choco
Choco solver Docker image


Bugs in
/tool/choco/choco-parsers/src/main/bash/fzn-exec.sh,
where in the command line
 java -server  -cp .:/tool/choco/choco-parsers.jar org.chocosolver.parser.flatzinc.ChocoFZN "test.fzn"  -tl -1 -p 1

 -tl -1 should be deleted

===

Be ware of new parameters


% java -server  -cp .:/tool/choco/choco-parsers.jar org.chocosolver.parser.flatzinc.ChocoFZN "test.fzn"  -tl -1 -p 1
% [test.fzn, -tl, -1, -p, 1]
"-tl" is not a valid option
ChocoFZN [options...] file
 file                                   : File to parse.
 -a (--all)                             : Search for all solutions (default:
                                          false). (default: false)
 -cos                                   : Tell the solver to use conflict
                                          ordering search. (default: false)
 -csv (--print-csv)                     : Print statistics on exit (default:
                                          false). (default: false)
 -cum (--cumulative) VAL                : Cumulative decomposition (default:
                                          GLB). (default: GLB)
 -dfx                                   : Force default explanation algorithm.
                                          (default: false)
 -exp                                   : Plug explanation in (default: false).
                                          (default: false)
 -f (--free-search)                     : Ignore search strategy. (default:
                                          false)
 -last                                  : Tell the solver to use use progress
                                          (or phase) saving. (default: false)
 -lc (--lact-conflict) N                : Tell the solver to use last-conflict
                                          reasoning. (default: 1)
 -limit [String+]                       : Resolution limits (XXhYYmZZs,Nruns,Mso
                                          ls) where each is optional (no space
                                          allowed). (default: org.chocosolver.pa
                                          rser.ParserParameters$LimConf@2db0f6b2
                                          )
 -p (--nb-cores) N                      : Number of cores available for
                                          parallel search (default: 1).
                                          (default: 1)
 -pa (--parser) N                       : Parser to use.
                                          0: automatic
                                           1: FlatZinc (.fzn)
                                          2: XCSP3 (.xml or .lzma)
                                          3: MPS (.mps)
                                          4: JSON (.json). (default: 0)
 -restarts [String,int,double?,int]     : Define the restart heuristic to use.
                                          Expected format: (policy,cutoff,offset
                                          )  (no space allowed) (default:
                                          org.chocosolver.parser.ParserParameter
                                          s$ResConf@3cd1f1c8)
 -s (--settings) FILE                   : Configuration settings.
 -seed N                                : Set the seed for random number
                                          generator.  (default: 0)
 -stat (--print-statistics)             : Print statistics on each solution
                                          (default: false). (default: false)
 -valh (--valHeuristic) [BEST |         : Define the value heuristic to use.
 DEFAULT | MAX | MED | MIN | RAND]        (default: DEFAULT)
 -varh (--varHeuristic) [ABS |          : Define the variable heuristic to use.
 ACTIVITY | CHS | DOM | DOMWDEG |         (default: DEFAULT)
 DOMWDEGR | DEFAULT | IBS | IMPACT |
# # -------------------------------------------------------------------------------------------------
# # -------------------------------------------------------------------------------------------------

# root = function(classif.task){

#   # defining a learner
#   # classif.task = iris.task
#   lrn = makeLearner("classif.svm", predict.type="prob")

#   # search space for SVMs
#   ps = getSvmSpace()

#   # Tuning control strategies
#   ctrl.grid   = makeTuneControlGrid(resolution=round(sqrt(BUDGET))) # 2 dimensions
#   ctrl.random = makeTuneControlRandom(maxit=BUDGET)
#   # ctrl.irace  = makeTuneControlIrace(maxExperiments = BUDGET)
#   # ctrl.gensa  = makeTuneControlGenSA(budget = BUDGET)
#   # ctrl.pso    = makeTuneControlCMAES(budget = BUDGET)
#   # ctrl.cmaes  = makeTuneControlCMAES(budget = BUDGET)
#   # ctrl.cmaes  = makeTuneControlCMAES(budget = BUDGET)

#   # list of tuning controls
#   ctrls = list(ctrl.grid, ctrl.random ) #, ctrl.irace, ctrl.gensa, ctrl.cmaes)

#   # resampling descrption for tuning
#     inner = makeResampleDesc("CV", iters=5, stratify=TRUE)
#     outer = makeResampleInstance("RepCV", reps=EPOCHS, folds=FOLDS, stratify=TRUE, 
#       task=classif.task)
    
#     logdebug(" - Calling tuning techniques");

#   # Calling tuning techniques
#   aux = lapply(ctrls, function(ct){
#       lrn2 = makeTuneWrapper(learner=lrn, resampling=inner, par.set=ps, control=ct, show.info=FALSE)
#     res = resample(learner=lrn2, task=classif.task, resampling=outer, extract=getTuneResult, 
#       models=TRUE, show.info = FALSE,
#         measures=list(mmce, acc, ber, multiclass.auc, timetrain, timepredict, timeboth)
#       )
#       return(res)
#   })

#   return(aux)
# }

# # -------------------------------------------------------------------------------------------------
# # -------------------------------------------------------------------------------------------------

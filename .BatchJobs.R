# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# BatchJobs configuration file
# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

# Run in a multicore with all the available cores (it can be changed)
cluster.functions = makeClusterFunctionsMulticore()

#mail settings
mail.start = "none"
mail.done  = "none"
mail.error = "none"
mail.from  = "<my@sender.address.com>"
mail.to    = "<my@recipient.address.com>"
mail.control = list(smtpServer="my.mail.server.com")

# using staged queries ?
staged.queries = TRUE

# debug mode ?
debug = TRUE

# defaults resources - walltime = 8 hs (in seconds) memory = 10 Gbs (in Mbs)
default.resources = list(walltime = 8*60*60, memory = 10*1024) 

# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------

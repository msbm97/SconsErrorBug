#!/bin/python
""" Top level build script for TRACE """

#####################################
#  Import necessary python modules  #
#####################################
import os
import sys
# Skip a line to make standard output a little easier on the eyes
print ("")

#################################################
#  Make sure the correct SCons version is used  #
#################################################
EnsureSConsVersion(0,96)


#################################################
#  Establish allowed command line options       #
#################################################

#  Append an option to this list to add a new option to the build script
optionList = [
               BoolVariable('libBuild', 'Build Trace as a static library for integration into MOOSE', 0),
             ]


#  Register the command line options allowed by this script
opts = Variables()
for option in optionList:
  opts.Add(option)

#################################################
#  Establish a default contruction environment  #
#################################################

env = Environment(options=opts)              # Propagate options through to environment
                                             # as construction variables

###########################
#  Establish help system  #
###########################

help_text = "\n" + "The following options are available when building TRACE (in addition to the scons built-in options)\n" + opts.GenerateHelpText(env)
Help(help_text)


####################################
#  Process command line arguments  #
####################################

# What platform are we building on?
platform = env['PLATFORM']
if platform == 'posix':
   platform = sys.platform


# What compiler environment and architecture should we use to build the code.
fcompiler = 'gfortran'



# Determine if the code should compile as a static library
if env['libBuild'] == 0:
   projectType = 'exe'
else:
    projectType='shared'



#  Establish the default target to be built, if the user does not specify it on the command line
Default(['src',])


##################################################
#  Establish the names of the build directories  #
##################################################

build_root = os.getcwd()+os.sep+'build' + os.sep
iapws_build_dir = build_root + 'IAPWSLib'
common_build_dir = build_root + 'common'
trace_build_dir = build_root + 'src'

#  Make these directory names available to all other SConscript files
Export([
        'fcompiler',
        'platform',
        'trace_build_dir',
        'common_build_dir',
        'iapws_build_dir',
        'projectType'
      ])


####################
#  Build the code  #
####################

common_target  = env.SConscript('common/SConscript',  variant_dir=common_build_dir,  exports='env', duplicate=1)
iapws_target   = env.SConscript('IAPWSLib/SConscript',  variant_dir=iapws_build_dir, exports=['env', 'common_target'],
                                duplicate=1)
trace_target   = env.SConscript('src/SConscript',   variant_dir=trace_build_dir,   exports=['env', 'common_target',
                                'iapws_target'], duplicate=1)

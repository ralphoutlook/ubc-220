# -k to skip error
# -v show all build info
define bb
  bitbake $(1) 
endef
define bb_forcecompile
  bitbake $(1) -f -c $(2)
endef

define bb_listtargets
  bitbake -s  
endef

define bb_listtasks
  bitbake $(1) -c listtasks
endef

define bb_dependencies
  bitbake -g $(1) && cat pn-depends.dot | grep -v -e '-native' | grep -v digraph | grep -v -e '-image' | awk '{print $$1}' | sort | uniq
endef


#########################################################################
# vim: ts=8 sw=8
#########################################################################
# Author:   tf135c (James Reynolds)
# Filename: Makefile
# Date:     2006-12-12 10:50:29
#########################################################################
# Note that we use '::' rules to allow multiple rule sets for the same
# target.  Read that as "modularity exemplarized".
#########################################################################

PREFIX	:=${DESTDIR}${HOME}/opt
BINDIR	=${PREFIX}/bin

TARGETS	=all clean distclean clobber check install uninstall tags
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

all::	ldd-laird

${TARGETS}::

clean::
	${RM} a.out *.o core.* lint tags

distclean clobber:: clean

check::	ldd-laird
	./ldd-laird ${ARGS}

install:: ldd-laird
	install -d ${BINDIR}
	install -c ldd-laird ${BINDIR}/

uninstall::
	${RM} ${BINDIR}/ldd-laird

tags::
	ctags -R .

# ${TARGETS}::
# 	${MAKE} TARGET=$@ ${SUBDIRS}

# ${SUBDIRS}::
# 	${MAKE} -C $@ ${TARGET}

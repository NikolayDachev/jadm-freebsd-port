# $FreeBSD$

PORTNAME= jadm
PORTVERSION= 1.0
CATEGORIES= sysutils

MAINTAINER= jadm@dachev.info
COMMENT= Jail framework with vnet, zfs and jail.conf support

USE_GITHUB= yes
GH_ACCOUNT= NikolayDachev
GH_COMMIT= 2e23393
GH_TAGNAME= 1.0

USE_PYTHON=yes
BUILD_DEPENDS=	${LOCALBASE}/bin/easy_install-${PYTHON_VER}:${PORTSDIR}/devel/py-setuptools

pre-install:
# remove junk if exist
	${RM} ${PYTHON_LIBDIR}/site-packages/jadm*egg
	${CP} ${WRKSRC}/man8/jadm.8 ${WRKDIR}/stage${PREFIX}/man/man8
	${CP} ${WRKSRC}/jadm ${WRKDIR}/stage${PREFIX}/bin/

post-install:
# remove jadm.8 installed from setup.py
	${RM} ${PREFIX}/man/man8/jadm.8

.include <bsd.port.mk>

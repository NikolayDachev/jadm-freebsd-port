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
USE_PYDISTUTILS=yes

BUILD_DEPENDS=	${PYTHON_LIBDIR}/site-packages/paramiko/:${PORTSDIR}/security/py-paramiko \
		${PYTHON_LIBDIR}/site-packages/netifaces.so:${PORTSDIR}/net/py-netifaces 

pre-install:
	${CP} ${WRKSRC}/man8/jadm.8 ${WRKDIR}/stage${PREFIX}/man/man8
	${CP} ${WRKSRC}/jadm ${WRKDIR}/stage${PREFIX}/bin/

post-install:
# remove jadm.8 installed from setup.py
	${RM} ${PREFIX}/man/man8/jadm.8

.include <bsd.port.mk>

# $FreeBSD$

PORTNAME= jadm
PORTVERSION= 1.0
CATEGORIES= sysutils

MAINTAINER= jadm@dachev.info
COMMENT= Jail framework with vnet, zfs and jail.conf support

USE_GITHUB= yes
GH_ACCOUNT= NikolayDachev
GH_COMMIT= 854e6fe
GH_TAGNAME= 1.0

USE_PYTHON=yes
USE_PYDISTUTILS=yes

.if ! exists(/usr/local/bin/pip)
BUILD_DEPENDS= py-pip:${PORTSDIR}/devel/py-pip
.endif

pre-install:
	${CP} ${WRKSRC}/man8/jadm.8 ${WRKDIR}/stage${PREFIX}/man/man8

post-install:
# remove jadm.8 installed from setup.py
	${RM} ${PREFIX}/man/man8/jadm.8

	pip install tabulate
	pip install ipaddress
	pip install netifaces
	pip install paramiko

.include <bsd.port.mk>

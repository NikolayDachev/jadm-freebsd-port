# $FreeBSD$

PORTNAME= jadm
PORTVERSION= 1.0
CATEGORIES= sysutils

USE_GITHUB= yes
GH_ACCOUNT= NikolayDachev
GH_COMMIT= 05ded8d
GH_TAGNAME= 1.0

MAINTAINER= jadm@dachev.info
COMMENT= FreeBSD jail framework with vnet, zfs and jail.conf support

USE_PYTHON=yes
USE_PYDISTUTILS=yes

.if ! exists(/usr/local/bin/pip)
BUILD_DEPENDS= py-pip:${PORTSDIR}/devel/py-pip
.endif

post-install:
	pip install tabulate
	pip install ipaddress
	pip install netifaces
	pip install paramiko

.include <bsd.port.mk>

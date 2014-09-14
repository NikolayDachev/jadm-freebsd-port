 # $FreeBSD$

PORTNAME= jadm
PORTVERSION= 1.0
CATEGORIES= sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=  ${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	jadm@dachev.info
COMMENT=	FreeBSD jail framework with zfs, vnet and jail.conf support

LICENSE=	BSD

BUILD_DEPENDS=	${PYTHON_LIBDIR}/site-packages/paramiko/:${PORTSDIR}/security/py-paramiko \
		${PYTHON_LIBDIR}/site-packages/netifaces.so:${PORTSDIR}/net/py-netifaces \
		${PYTHON_LIBDIR}/site-packages/tabulate.py:${PORTSDIR}/devel/py-tabulate \
		${PYTHON_LIBDIR}/site-packages/ipaddress.py:${PORTSDIR}/net/py-ipaddress

USES=           python
USE_PYTHON=     distutils autoplist

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 901000
IGNORE=		 freeBSD before 9.1 is not supported
.endif

pre-install:
	${CP} ${WRKSRC}/man8/jadm.8 ${WRKDIR}/stage${PREFIX}/man/man8

post-install:
# remove jadm.8 installed from setup.py
	${RM} ${PREFIX}/man/man8/jadm.8

.include <bsd.port.mk>

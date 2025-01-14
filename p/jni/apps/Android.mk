# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    openssl.c verify.c asn1pars.c req.c dgst.c dh.c enc.c passwd.c gendh.c errstr.c ca.c \
    pkcs7.c crl2p7.c crl.c \
    rsa.c rsautl.c dsa.c dsaparam.c ecparam.c \
    x509.c genrsa.c gendsa.c s_client.c speed.c \
    s_time.c  apps.c s_cb.c s_socket.c app_rand.c  version.c sess_id.c \
    ciphers.c nseq.c pkcs12.c pkcs8.c spkac.c smime.c rand.c engine.c \
    ocsp.c prime.c dhparam.c

#   cms.c ec.c s_server.c

LOCAL_SHARED_LIBRARIES := \
	libssl \
	libcrypto 

LOCAL_C_INCLUDES := \
	openssl \

LOCAL_CFLAGS := -DMONOLITH

LOCAL_CFLAGS += -DOPENSSL_NO_ECDH

LOCAL_CFLAGS += -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN -DOPENSSL_NO_HW
LOCAL_CFLAGS += -DOPENSSL_NO_CAMELLIA -DOPENSSL_NO_CAST -DOPENSSL_NO_CMS -DOPENSSL_NO_GMP -DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2 -DOPENSSL_NO_RC5 -DOPENSSL_NO_RFC3779 -DOPENSSL_NO_SEED -DOPENSSL_NO_TLSEXT -DOPENSSL_NO_MD2 -DOPENSSL_NO_EC -DOPENSSL_NO_ECDH -DOPENSSL_NO_ECDSA -DOPENSSL_NO_OCSP


# These flags omit whole features from the commandline "openssl".
# However, portions of these features are actually turned on.
LOCAL_CFLAGS += -DOPENSSL_NO_EC -DOPENSSL_NO_ECDSA -DOPENSSL_NO_DTLS1


LOCAL_MODULE:= openssl

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

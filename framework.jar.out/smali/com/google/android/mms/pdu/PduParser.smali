.class public Lcom/google/android/mms/pdu/PduParser;
.super Ljava/lang/Object;
.source "PduParser.java"


# static fields
#the value of this static final field might be set in the static constructor
.field static final synthetic $assertionsDisabled:Z = false

.field private static final DEBUG:Z = true

.field private static final END_STRING_FLAG:I = 0x0

.field private static final LENGTH_QUOTE:I = 0x1f

.field private static final LOCAL_LOGV:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "PduParser"

.field private static final LONG_INTEGER_LENGTH_MAX:I = 0x8

.field private static final QUOTE:I = 0x7f

.field private static final QUOTED_STRING_FLAG:I = 0x22

.field private static final SHORT_INTEGER_MAX:I = 0x7f

.field private static final SHORT_LENGTH_MAX:I = 0x1e

.field private static final TEXT_MAX:I = 0x7f

.field private static final TEXT_MIN:I = 0x20

.field private static final THE_FIRST_PART:I = 0x0

.field private static final THE_LAST_PART:I = 0x1

.field private static final TYPE_QUOTED_STRING:I = 0x1

.field private static final TYPE_TEXT_STRING:I = 0x0

.field private static final TYPE_TOKEN_STRING:I = 0x2

.field private static mStartParam:[B

.field private static mTypeParam:[B


# instance fields
.field private mBody:Lcom/google/android/mms/pdu/PduBody;

.field private mForRestore:Z

.field private mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

.field private mPduDataStream:Ljava/io/ByteArrayInputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 35
    const-class v0, Lcom/google/android/mms/pdu/PduParser;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    .line 78
    sput-object v1, Lcom/google/android/mms/pdu/PduParser;->mTypeParam:[B

    .line 83
    sput-object v1, Lcom/google/android/mms/pdu/PduParser;->mStartParam:[B

    return-void

    .line 35
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>([B)V
    .locals 1
    .parameter "pduDataStream"

    .prologue
    const/4 v0, 0x0

    .line 97
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object v0, p0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    .line 68
    iput-object v0, p0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    .line 73
    iput-object v0, p0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/mms/pdu/PduParser;->mForRestore:Z

    .line 98
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    .line 99
    return-void
.end method

.method protected static checkMandatoryHeader(Lcom/google/android/mms/pdu/PduHeaders;)Z
    .locals 37
    .parameter "headers"

    .prologue
    .line 1888
    if-nez p0, :cond_0

    .line 1889
    const/16 v35, 0x0

    .line 2126
    :goto_0
    return v35

    .line 1893
    :cond_0
    const/16 v35, 0x8c

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v8

    .line 1896
    .local v8, messageType:I
    const/16 v35, 0x8d

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v9

    .line 1897
    .local v9, mmsVersion:I
    if-nez v9, :cond_1

    .line 1899
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: PDU hasn\'t mmsVersion"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1900
    const/16 v35, 0x0

    goto :goto_0

    .line 1904
    :cond_1
    packed-switch v8, :pswitch_data_0

    .line 2122
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: Parser doesn\'t support this message type in this version"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2123
    const/16 v35, 0x0

    goto :goto_0

    .line 1907
    :pswitch_0
    const/16 v35, 0x84

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v34

    .line 1908
    .local v34, srContentType:[B
    if-nez v34, :cond_13

    .line 1909
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_SEND_REQ PDU hasn\'t content type field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1910
    const/16 v35, 0x0

    goto :goto_0

    .line 1931
    .end local v34           #srContentType:[B
    :pswitch_1
    const/16 v35, 0x92

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v32

    .line 1932
    .local v32, scResponseStatus:I
    if-nez v32, :cond_2

    .line 1933
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_SEND_CONF PDU hasn\'t Response-Status field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1934
    const/16 v35, 0x0

    goto :goto_0

    .line 1938
    :cond_2
    const/16 v35, 0x98

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v33

    .line 1939
    .local v33, scTransactionId:[B
    if-nez v33, :cond_13

    .line 1940
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_SEND_CONF PDU hasn\'t Transaction-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1941
    const/16 v35, 0x0

    goto :goto_0

    .line 1947
    .end local v32           #scResponseStatus:I
    .end local v33           #scTransactionId:[B
    :pswitch_2
    const/16 v35, 0x83

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v10

    .line 1948
    .local v10, niContentLocation:[B
    if-nez v10, :cond_3

    .line 1949
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFICATION_IND PDU hasn\'t Content-Location field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1950
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1954
    :cond_3
    const/16 v35, 0x88

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getLongInteger(I)J

    move-result-wide v11

    .line 1955
    .local v11, niExpiry:J
    const-wide/16 v35, -0x1

    cmp-long v35, v35, v11

    if-nez v35, :cond_4

    .line 1956
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFICATION_IND PDU hasn\'t Expiry field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1957
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1961
    :cond_4
    const/16 v35, 0x8a

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v13

    .line 1962
    .local v13, niMessageClass:[B
    if-nez v13, :cond_5

    .line 1963
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFICATION_IND PDU hasn\'t Message-Class field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1964
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1968
    :cond_5
    const/16 v35, 0x8e

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getLongInteger(I)J

    move-result-wide v14

    .line 1969
    .local v14, niMessageSize:J
    const-wide/16 v35, -0x1

    cmp-long v35, v35, v14

    if-nez v35, :cond_6

    .line 1970
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFICATION_IND PDU hasn\'t Message-Size field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1971
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1975
    :cond_6
    const/16 v35, 0x98

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v16

    .line 1976
    .local v16, niTransactionId:[B
    if-nez v16, :cond_13

    .line 1977
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFICATION_IND PDU hasn\'t Transaction-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1978
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1984
    .end local v10           #niContentLocation:[B
    .end local v11           #niExpiry:J
    .end local v13           #niMessageClass:[B
    .end local v14           #niMessageSize:J
    .end local v16           #niTransactionId:[B
    :pswitch_3
    const/16 v35, 0x95

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v17

    .line 1985
    .local v17, nriStatus:I
    if-nez v17, :cond_7

    .line 1986
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFYRESP_IND PDU hasn\'t Status field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1987
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 1991
    :cond_7
    const/16 v35, 0x98

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v18

    .line 1992
    .local v18, nriTransactionId:[B
    if-nez v18, :cond_13

    .line 1993
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_NOTIFYRESP_IND PDU hasn\'t Transaction-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1994
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2000
    .end local v17           #nriStatus:I
    .end local v18           #nriTransactionId:[B
    :pswitch_4
    const/16 v35, 0x84

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v19

    .line 2001
    .local v19, rcContentType:[B
    if-nez v19, :cond_8

    .line 2002
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_RETRIEVE_CONF PDU hasn\'t Content-Type field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2003
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2007
    :cond_8
    const/16 v35, 0x85

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getLongInteger(I)J

    move-result-wide v20

    .line 2008
    .local v20, rcDate:J
    const-wide/16 v35, -0x1

    cmp-long v35, v35, v20

    if-nez v35, :cond_13

    .line 2009
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_RETRIEVE_CONF PDU hasn\'t Date field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2010
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2016
    .end local v19           #rcContentType:[B
    .end local v20           #rcDate:J
    :pswitch_5
    const/16 v35, 0x85

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getLongInteger(I)J

    move-result-wide v3

    .line 2017
    .local v3, diDate:J
    const-wide/16 v35, -0x1

    cmp-long v35, v35, v3

    if-nez v35, :cond_9

    .line 2018
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_DELIVERY_IND PDU hasn\'t Date field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2019
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2023
    :cond_9
    const/16 v35, 0x8b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v5

    .line 2024
    .local v5, diMessageId:[B
    if-nez v5, :cond_a

    .line 2025
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_DELIVERY_IND PDU hasn\'t Message-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2026
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2030
    :cond_a
    const/16 v35, 0x95

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v6

    .line 2031
    .local v6, diStatus:I
    if-nez v6, :cond_b

    .line 2032
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_DELIVERY_IND PDU hasn\'t Status field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2033
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2037
    :cond_b
    const/16 v35, 0x97

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getEncodedStringValues(I)[Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v7

    .line 2038
    .local v7, diTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    if-nez v7, :cond_13

    .line 2039
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_DELIVERY_IND PDU hasn\'t To field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2040
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2046
    .end local v3           #diDate:J
    .end local v5           #diMessageId:[B
    .end local v6           #diStatus:I
    .end local v7           #diTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    :pswitch_6
    const/16 v35, 0x98

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v2

    .line 2047
    .local v2, aiTransactionId:[B
    if-nez v2, :cond_13

    .line 2048
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_ACKNOWLEDGE_IND PDU hasn\'t Transaction-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2049
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2055
    .end local v2           #aiTransactionId:[B
    :pswitch_7
    const/16 v35, 0x85

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getLongInteger(I)J

    move-result-wide v22

    .line 2056
    .local v22, roDate:J
    const-wide/16 v35, -0x1

    cmp-long v35, v35, v22

    if-nez v35, :cond_c

    .line 2057
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_ORIG_IND PDU hasn\'t Date field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2058
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2062
    :cond_c
    const/16 v35, 0x89

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getEncodedStringValue(I)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v24

    .line 2063
    .local v24, roFrom:Lcom/google/android/mms/pdu/EncodedStringValue;
    if-nez v24, :cond_d

    .line 2064
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_ORIG_IND PDU hasn\'t From field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2065
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2069
    :cond_d
    const/16 v35, 0x8b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v25

    .line 2070
    .local v25, roMessageId:[B
    if-nez v25, :cond_e

    .line 2071
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_ORIG_IND PDU hasn\'t Message-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2072
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2076
    :cond_e
    const/16 v35, 0x9b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v26

    .line 2077
    .local v26, roReadStatus:I
    if-nez v26, :cond_f

    .line 2078
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_ORIG_IND PDU hasn\'t Read-Status field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2079
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2083
    :cond_f
    const/16 v35, 0x97

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getEncodedStringValues(I)[Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v27

    .line 2084
    .local v27, roTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    if-nez v27, :cond_13

    .line 2085
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_ORIG_IND PDU hasn\'t To field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2086
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2092
    .end local v22           #roDate:J
    .end local v24           #roFrom:Lcom/google/android/mms/pdu/EncodedStringValue;
    .end local v25           #roMessageId:[B
    .end local v26           #roReadStatus:I
    .end local v27           #roTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    :pswitch_8
    const/16 v35, 0x89

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getEncodedStringValue(I)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v28

    .line 2093
    .local v28, rrFrom:Lcom/google/android/mms/pdu/EncodedStringValue;
    if-nez v28, :cond_10

    .line 2094
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_REC_IND PDU hasn\'t From field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2095
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2099
    :cond_10
    const/16 v35, 0x8b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v29

    .line 2100
    .local v29, rrMessageId:[B
    if-nez v29, :cond_11

    .line 2101
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_REC_IND PDU hasn\'t Message-Id field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2102
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2106
    :cond_11
    const/16 v35, 0x9b

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v30

    .line 2107
    .local v30, rrReadStatus:I
    if-nez v30, :cond_12

    .line 2108
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_REC_IND PDU hasn\'t Read-Status field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2109
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2113
    :cond_12
    const/16 v35, 0x97

    move-object/from16 v0, p0

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->getEncodedStringValues(I)[Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v31

    .line 2114
    .local v31, rrTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    if-nez v31, :cond_13

    .line 2115
    const-string v35, "PduParser"

    const-string v36, "Parse MandatoryHeader Failed: MESSAGE_TYPE_READ_REC_IND PDU hasn\'t To field"

    invoke-static/range {v35 .. v36}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2116
    const/16 v35, 0x0

    goto/16 :goto_0

    .line 2126
    .end local v28           #rrFrom:Lcom/google/android/mms/pdu/EncodedStringValue;
    .end local v29           #rrMessageId:[B
    .end local v30           #rrReadStatus:I
    .end local v31           #rrTo:[Lcom/google/android/mms/pdu/EncodedStringValue;
    :cond_13
    const/16 v35, 0x1

    goto/16 :goto_0

    .line 1904
    nop

    :pswitch_data_0
    .packed-switch 0x80
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method private static checkPartPosition(Lcom/google/android/mms/pdu/PduPart;)I
    .locals 5
    .parameter "part"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1852
    sget-boolean v4, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1853
    :cond_0
    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mTypeParam:[B

    if-nez v4, :cond_2

    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mStartParam:[B

    if-nez v4, :cond_2

    .line 1878
    :cond_1
    :goto_0
    return v2

    .line 1859
    :cond_2
    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mStartParam:[B

    if-eqz v4, :cond_3

    .line 1860
    invoke-virtual {p0}, Lcom/google/android/mms/pdu/PduPart;->getContentId()[B

    move-result-object v0

    .line 1861
    .local v0, contentId:[B
    if-eqz v0, :cond_3

    .line 1862
    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mStartParam:[B

    invoke-static {v4, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-ne v2, v4, :cond_3

    move v2, v3

    .line 1863
    goto :goto_0

    .line 1869
    .end local v0           #contentId:[B
    :cond_3
    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mTypeParam:[B

    if-eqz v4, :cond_1

    .line 1870
    invoke-virtual {p0}, Lcom/google/android/mms/pdu/PduPart;->getContentType()[B

    move-result-object v1

    .line 1871
    .local v1, contentType:[B
    if-eqz v1, :cond_1

    .line 1872
    sget-object v4, Lcom/google/android/mms/pdu/PduParser;->mTypeParam:[B

    invoke-static {v4, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-ne v2, v4, :cond_1

    move v2, v3

    .line 1873
    goto :goto_0
.end method

.method protected static extractByteValue(Ljava/io/ByteArrayInputStream;)I
    .locals 2
    .parameter "pduDataStream"

    .prologue
    .line 1213
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1214
    :cond_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v0

    .line 1215
    .local v0, temp:I
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-ne v1, v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1216
    :cond_1
    and-int/lit16 v1, v0, 0xff

    return v1
.end method

.method protected static getWapString(Ljava/io/ByteArrayInputStream;I)[B
    .locals 4
    .parameter "pduDataStream"
    .parameter "stringType"

    .prologue
    const/4 v3, -0x1

    .line 1179
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1180
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1181
    .local v0, out:Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    .line 1182
    .local v1, temp:I
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    if-ne v3, v1, :cond_1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1183
    :cond_1
    if-eq v3, v1, :cond_4

    if-eqz v1, :cond_4

    .line 1185
    const/4 v2, 0x2

    if-ne p1, v2, :cond_3

    .line 1186
    invoke-static {v1}, Lcom/google/android/mms/pdu/PduParser;->isTokenCharacter(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1187
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1195
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    .line 1196
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    if-ne v3, v1, :cond_1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1190
    :cond_3
    invoke-static {v1}, Lcom/google/android/mms/pdu/PduParser;->isText(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1191
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 1199
    :cond_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 1200
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 1203
    :goto_1
    return-object v2

    :cond_5
    const/4 v2, 0x0

    goto :goto_1
.end method

.method protected static isText(I)Z
    .locals 2
    .parameter "ch"

    .prologue
    const/4 v0, 0x1

    .line 1163
    const/16 v1, 0x20

    if-lt p0, v1, :cond_0

    const/16 v1, 0x7e

    if-le p0, v1, :cond_1

    :cond_0
    const/16 v1, 0x80

    if-lt p0, v1, :cond_2

    const/16 v1, 0xff

    if-gt p0, v1, :cond_2

    .line 1174
    :cond_1
    :goto_0
    :pswitch_0
    return v0

    .line 1167
    :cond_2
    packed-switch p0, :pswitch_data_0

    .line 1174
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1167
    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected static isTokenCharacter(I)Z
    .locals 2
    .parameter "ch"

    .prologue
    const/4 v0, 0x0

    .line 1119
    const/16 v1, 0x21

    if-lt p0, v1, :cond_0

    const/16 v1, 0x7e

    if-le p0, v1, :cond_1

    .line 1144
    :cond_0
    :goto_0
    :sswitch_0
    return v0

    .line 1123
    :cond_1
    sparse-switch p0, :sswitch_data_0

    .line 1144
    const/4 v0, 0x1

    goto :goto_0

    .line 1123
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_0
        0x28 -> :sswitch_0
        0x29 -> :sswitch_0
        0x2c -> :sswitch_0
        0x2f -> :sswitch_0
        0x3a -> :sswitch_0
        0x3b -> :sswitch_0
        0x3c -> :sswitch_0
        0x3d -> :sswitch_0
        0x3e -> :sswitch_0
        0x3f -> :sswitch_0
        0x40 -> :sswitch_0
        0x5b -> :sswitch_0
        0x5c -> :sswitch_0
        0x5d -> :sswitch_0
        0x7b -> :sswitch_0
        0x7d -> :sswitch_0
    .end sparse-switch
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "text"

    .prologue
    .line 940
    const-string v0, "PduParser"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 942
    return-void
.end method

.method protected static parseContentType(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;)[B
    .locals 11
    .parameter "pduDataStream"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ByteArrayInputStream;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;)[B"
        }
    .end annotation

    .prologue
    .line 1561
    .local p1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    sget-boolean v9, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v9, :cond_0

    if-nez p0, :cond_0

    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9

    .line 1563
    :cond_0
    const/4 v0, 0x0

    .line 1564
    .local v0, contentType:[B
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1565
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v8

    .line 1566
    .local v8, temp:I
    sget-boolean v9, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v9, :cond_1

    const/4 v9, -0x1

    if-ne v9, v8, :cond_1

    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9

    .line 1567
    :cond_1
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1569
    and-int/lit16 v1, v8, 0xff

    .line 1571
    .local v1, cur:I
    const/16 v9, 0x20

    if-ge v1, v9, :cond_7

    .line 1572
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    move-result v5

    .line 1573
    .local v5, length:I
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v7

    .line 1574
    .local v7, startPos:I
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1575
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v8

    .line 1576
    sget-boolean v9, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v9, :cond_2

    const/4 v9, -0x1

    if-ne v9, v8, :cond_2

    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9

    .line 1577
    :cond_2
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1578
    and-int/lit16 v3, v8, 0xff

    .line 1580
    .local v3, first:I
    const/16 v9, 0x20

    if-lt v3, v9, :cond_4

    const/16 v9, 0x7f

    if-gt v3, v9, :cond_4

    .line 1581
    const/4 v9, 0x0

    invoke-static {p0, v9}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v0

    .line 1596
    :goto_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v2

    .line 1597
    .local v2, endPos:I
    sub-int v9, v7, v2

    sub-int v6, v5, v9

    .line 1598
    .local v6, parameterLen:I
    if-lez v6, :cond_3

    .line 1599
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {p0, p1, v9}, Lcom/google/android/mms/pdu/PduParser;->parseContentTypeParams(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;Ljava/lang/Integer;)V

    .line 1602
    :cond_3
    if-gez v6, :cond_8

    .line 1603
    const-string v9, "PduParser"

    const-string v10, "Corrupt MMS message"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1604
    sget-object v9, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .line 1613
    .end local v2           #endPos:I
    .end local v3           #first:I
    .end local v5           #length:I
    .end local v6           #parameterLen:I
    .end local v7           #startPos:I
    :goto_1
    return-object v9

    .line 1582
    .restart local v3       #first:I
    .restart local v5       #length:I
    .restart local v7       #startPos:I
    :cond_4
    const/16 v9, 0x7f

    if-le v3, v9, :cond_6

    .line 1583
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v4

    .line 1585
    .local v4, index:I
    sget-object v9, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    array-length v9, v9

    if-ge v4, v9, :cond_5

    .line 1586
    sget-object v9, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    aget-object v9, v9, v4

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_0

    .line 1588
    :cond_5
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1589
    const/4 v9, 0x0

    invoke-static {p0, v9}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v0

    goto :goto_0

    .line 1592
    .end local v4           #index:I
    :cond_6
    const-string v9, "PduParser"

    const-string v10, "Corrupt content-type"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1593
    sget-object v9, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    goto :goto_1

    .line 1606
    .end local v3           #first:I
    .end local v5           #length:I
    .end local v7           #startPos:I
    :cond_7
    const/16 v9, 0x7f

    if-gt v1, v9, :cond_9

    .line 1607
    const/4 v9, 0x0

    invoke-static {p0, v9}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v0

    :cond_8
    :goto_2
    move-object v9, v0

    .line 1613
    goto :goto_1

    .line 1609
    :cond_9
    sget-object v9, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v10

    aget-object v9, v9, v10

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_2
.end method

.method protected static parseContentTypeParams(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;Ljava/lang/Integer;)V
    .locals 23
    .parameter "pduDataStream"
    .parameter
    .parameter "length"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ByteArrayInputStream;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1346
    .local p1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_0

    if-nez p0, :cond_0

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1347
    :cond_0
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_1

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    if-gtz v21, :cond_1

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1349
    :cond_1
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v18

    .line 1350
    .local v18, startPos:I
    const/16 v19, 0x0

    .line 1351
    .local v19, tempPos:I
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 1352
    .local v13, lastLen:I
    :goto_0
    if-lez v13, :cond_10

    .line 1353
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v15

    .line 1354
    .local v15, param:I
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_2

    const/16 v21, -0x1

    move/from16 v0, v21

    if-ne v0, v15, :cond_2

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1355
    :cond_2
    add-int/lit8 v13, v13, -0x1

    .line 1357
    packed-switch v15, :pswitch_data_0

    .line 1530
    :pswitch_0
    const-string v21, "PduParser"

    const-string v22, "Not supported Content-Type parameter"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1532
    const/16 v21, -0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/google/android/mms/pdu/PduParser;->skipWapValue(Ljava/io/ByteArrayInputStream;I)I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_f

    .line 1533
    const-string v21, "PduParser"

    const-string v22, "Corrupt Content-Type"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1373
    :pswitch_1
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1374
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v10

    .line 1375
    .local v10, first:I
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1376
    const/16 v21, 0x7f

    move/from16 v0, v21

    if-le v10, v0, :cond_4

    .line 1378
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v12

    .line 1380
    .local v12, index:I
    sget-object v21, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v12, v0, :cond_3

    .line 1381
    sget-object v21, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    aget-object v21, v21, v12

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->getBytes()[B

    move-result-object v20

    .line 1382
    .local v20, type:[B
    const/16 v21, 0x83

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    .end local v12           #index:I
    .end local v20           #type:[B
    :cond_3
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1395
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1396
    goto :goto_0

    .line 1388
    :cond_4
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v20

    .line 1389
    .restart local v20       #type:[B
    if-eqz v20, :cond_3

    if-eqz p1, :cond_3

    .line 1390
    const/16 v21, 0x83

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1413
    .end local v10           #first:I
    .end local v20           #type:[B
    :pswitch_2
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v17

    .line 1414
    .local v17, start:[B
    if-eqz v17, :cond_5

    if-eqz p1, :cond_5

    .line 1415
    const/16 v21, 0x99

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1418
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1419
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1420
    goto/16 :goto_0

    .line 1437
    .end local v17           #start:[B
    :pswitch_3
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1438
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v11

    .line 1439
    .local v11, firstValue:I
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1441
    const/16 v21, 0x20

    move/from16 v0, v21

    if-le v11, v0, :cond_6

    const/16 v21, 0x7f

    move/from16 v0, v21

    if-lt v11, v0, :cond_7

    :cond_6
    if-nez v11, :cond_9

    .line 1444
    :cond_7
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v5

    .line 1446
    .local v5, charsetStr:[B
    :try_start_0
    new-instance v21, Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Ljava/lang/String;-><init>([B)V

    invoke-static/range {v21 .. v21}, Lcom/google/android/mms/pdu/CharacterSets;->getMibEnumValue(Ljava/lang/String;)I

    move-result v4

    .line 1448
    .local v4, charsetInt:I
    const-string v21, "PduParser"

    const-string v22, "Parse CharacterSets: charsetStr"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1449
    const/16 v21, 0x81

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1464
    .end local v4           #charsetInt:I
    .end local v5           #charsetStr:[B
    :cond_8
    :goto_2
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1465
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1466
    goto/16 :goto_0

    .line 1450
    .restart local v5       #charsetStr:[B
    :catch_0
    move-exception v8

    .line 1452
    .local v8, e:Ljava/io/UnsupportedEncodingException;
    const-string v21, "PduParser"

    invoke-static {v5}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1453
    const/16 v21, 0x81

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const/16 v22, 0x0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1457
    .end local v5           #charsetStr:[B
    .end local v8           #e:Ljava/io/UnsupportedEncodingException;
    :cond_9
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseIntegerValue(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v21

    move-wide/from16 v0, v21

    long-to-int v3, v0

    .line 1458
    .local v3, charset:I
    if-eqz p1, :cond_8

    .line 1459
    const-string v21, "PduParser"

    const-string v22, "Parse Well-known-charset: charset"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1460
    const/16 v21, 0x81

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1478
    .end local v3           #charset:I
    .end local v11           #firstValue:I
    :pswitch_4
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v14

    .line 1479
    .local v14, name:[B
    if-eqz v14, :cond_a

    if-eqz p1, :cond_a

    .line 1480
    const/16 v21, 0x97

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1483
    :cond_a
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1484
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1485
    goto/16 :goto_0

    .line 1488
    .end local v14           #name:[B
    :pswitch_5
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v9

    .line 1489
    .local v9, fileName:[B
    if-eqz v9, :cond_b

    if-eqz p1, :cond_b

    .line 1490
    const/16 v21, 0x98

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1493
    :cond_b
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1494
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1495
    goto/16 :goto_0

    .line 1498
    .end local v9           #fileName:[B
    :pswitch_6
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v16

    .line 1499
    .local v16, path:[B
    if-eqz v16, :cond_c

    if-eqz p1, :cond_c

    .line 1500
    const/16 v21, 0x9d

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1503
    :cond_c
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1504
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1505
    goto/16 :goto_0

    .line 1508
    .end local v16           #path:[B
    :pswitch_7
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v6

    .line 1509
    .local v6, comment:[B
    if-eqz v6, :cond_d

    if-eqz p1, :cond_d

    .line 1510
    const/16 v21, 0x9b

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1513
    :cond_d
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1514
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1515
    goto/16 :goto_0

    .line 1518
    .end local v6           #comment:[B
    :pswitch_8
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v7

    .line 1519
    .local v7, domain:[B
    if-eqz v7, :cond_e

    if-eqz p1, :cond_e

    .line 1520
    const/16 v21, 0x9c

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1523
    :cond_e
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v19

    .line 1524
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Integer;->intValue()I

    move-result v21

    sub-int v22, v18, v19

    sub-int v13, v21, v22

    .line 1525
    goto/16 :goto_0

    .line 1535
    .end local v7           #domain:[B
    :cond_f
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 1541
    .end local v15           #param:I
    :cond_10
    if-eqz v13, :cond_11

    .line 1542
    const-string v21, "PduParser"

    const-string v22, "Corrupt Content-Type"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1544
    :cond_11
    return-void

    .line 1357
    nop

    :pswitch_data_0
    .packed-switch 0x81
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_6
    .end packed-switch
.end method

.method protected static parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;
    .locals 8
    .parameter "pduDataStream"

    .prologue
    .line 1018
    sget-boolean v7, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v7, :cond_0

    if-nez p0, :cond_0

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1019
    :cond_0
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1020
    const/4 v3, 0x0

    .line 1021
    .local v3, returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    const/4 v0, 0x0

    .line 1022
    .local v0, charset:I
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v5

    .line 1023
    .local v5, temp:I
    sget-boolean v7, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v7, :cond_1

    const/4 v7, -0x1

    if-ne v7, v5, :cond_1

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1024
    :cond_1
    and-int/lit16 v2, v5, 0xff

    .line 1026
    .local v2, first:I
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1027
    const/16 v7, 0x20

    if-ge v2, v7, :cond_2

    .line 1028
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 1030
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v0

    .line 1033
    :cond_2
    const/4 v7, 0x0

    invoke-static {p0, v7}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v6

    .line 1036
    .local v6, textString:[B
    if-eqz v0, :cond_3

    .line 1037
    :try_start_0
    new-instance v4, Lcom/google/android/mms/pdu/EncodedStringValue;

    invoke-direct {v4, v0, v6}, Lcom/google/android/mms/pdu/EncodedStringValue;-><init>(I[B)V

    .end local v3           #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    .local v4, returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    move-object v3, v4

    .end local v4           #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    .restart local v3       #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    :goto_0
    move-object v7, v3

    .line 1045
    :goto_1
    return-object v7

    .line 1039
    :cond_3
    new-instance v4, Lcom/google/android/mms/pdu/EncodedStringValue;

    invoke-direct {v4, v6}, Lcom/google/android/mms/pdu/EncodedStringValue;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3           #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    .restart local v4       #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    move-object v3, v4

    .end local v4           #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    .restart local v3       #returnValue:Lcom/google/android/mms/pdu/EncodedStringValue;
    goto :goto_0

    .line 1041
    :catch_0
    move-exception v1

    .line 1042
    .local v1, e:Ljava/lang/Exception;
    const/4 v7, 0x0

    goto :goto_1
.end method

.method protected static parseIntegerValue(Ljava/io/ByteArrayInputStream;)J
    .locals 3
    .parameter "pduDataStream"

    .prologue
    .line 1288
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1289
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1290
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v0

    .line 1291
    .local v0, temp:I
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-ne v1, v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1292
    :cond_1
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1293
    const/16 v1, 0x7f

    if-le v0, v1, :cond_2

    .line 1294
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v1

    int-to-long v1, v1

    .line 1296
    :goto_0
    return-wide v1

    :cond_2
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseLongInteger(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v1

    goto :goto_0
.end method

.method protected static parseLongInteger(Ljava/io/ByteArrayInputStream;)J
    .locals 9
    .parameter "pduDataStream"

    .prologue
    const/16 v8, 0x8

    const/4 v7, -0x1

    .line 1256
    sget-boolean v5, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v5, :cond_0

    if-nez p0, :cond_0

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1257
    :cond_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v4

    .line 1258
    .local v4, temp:I
    sget-boolean v5, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v5, :cond_1

    if-ne v7, v4, :cond_1

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1259
    :cond_1
    and-int/lit16 v0, v4, 0xff

    .line 1261
    .local v0, count:I
    if-le v0, v8, :cond_2

    .line 1262
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Octet count greater than 8 and I can\'t represent that!"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1265
    :cond_2
    const-wide/16 v2, 0x0

    .line 1267
    .local v2, result:J
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_4

    .line 1268
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v4

    .line 1269
    sget-boolean v5, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v5, :cond_3

    if-ne v7, v4, :cond_3

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1270
    :cond_3
    shl-long/2addr v2, v8

    .line 1271
    and-int/lit16 v5, v4, 0xff

    int-to-long v5, v5

    add-long/2addr v2, v5

    .line 1267
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1274
    :cond_4
    return-wide v2
.end method

.method protected static parsePartHeaders(Ljava/io/ByteArrayInputStream;Lcom/google/android/mms/pdu/PduPart;I)Z
    .locals 25
    .parameter "pduDataStream"
    .parameter "part"
    .parameter "length"

    .prologue
    .line 1626
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_0

    if-nez p0, :cond_0

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1627
    :cond_0
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_1

    if-nez p1, :cond_1

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1628
    :cond_1
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_2

    if-gtz p2, :cond_2

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1646
    :cond_2
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v11

    .line 1647
    .local v11, startPos:I
    const/4 v14, 0x0

    .line 1648
    .local v14, tempPos:I
    move/from16 v9, p2

    .line 1649
    .local v9, lastLen:I
    :cond_3
    :goto_0
    if-lez v9, :cond_16

    .line 1650
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1651
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v7

    .line 1652
    .local v7, header:I
    sget-boolean v21, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v21, :cond_4

    const/16 v21, -0x1

    move/from16 v0, v21

    if-ne v0, v7, :cond_4

    new-instance v21, Ljava/lang/AssertionError;

    invoke-direct/range {v21 .. v21}, Ljava/lang/AssertionError;-><init>()V

    throw v21

    .line 1653
    :cond_4
    add-int/lit8 v9, v9, -0x1

    .line 1655
    const/16 v21, 0x7f

    move/from16 v0, v21

    if-le v7, v0, :cond_e

    .line 1657
    sparse-switch v7, :sswitch_data_0

    .line 1764
    const-string v21, "PduParser"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Not supported Part headers: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1766
    const/16 v21, -0x1

    move-object/from16 v0, p0

    invoke-static {v0, v9}, Lcom/google/android/mms/pdu/PduParser;->skipWapValue(Ljava/io/ByteArrayInputStream;I)I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_d

    .line 1767
    const-string v21, "PduParser"

    const-string v22, "Corrupt Part headers"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1768
    const/16 v21, 0x0

    .line 1841
    .end local v7           #header:I
    :goto_1
    return v21

    .line 1663
    .restart local v7       #header:I
    :sswitch_0
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v4

    .line 1664
    .local v4, contentLocation:[B
    if-eqz v4, :cond_5

    .line 1665
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/google/android/mms/pdu/PduPart;->setContentLocation([B)V

    .line 1668
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1669
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1670
    goto :goto_0

    .line 1676
    .end local v4           #contentLocation:[B
    :sswitch_1
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v3

    .line 1677
    .local v3, contentId:[B
    if-eqz v3, :cond_6

    .line 1678
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/google/android/mms/pdu/PduPart;->setContentId([B)V

    .line 1681
    :cond_6
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1682
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1683
    goto/16 :goto_0

    .line 1685
    .end local v3           #contentId:[B
    :sswitch_2
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v20

    .line 1686
    .local v20, xWapContentUri:[B
    if-eqz v20, :cond_7

    .line 1687
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setXWapContentUri([B)V

    .line 1690
    :cond_7
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1691
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1693
    goto/16 :goto_0

    .line 1695
    .end local v20           #xWapContentUri:[B
    :sswitch_3
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseLongInteger(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v5

    .line 1696
    .local v5, date:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    const-wide/16 v23, 0x3e8

    div-long v5, v21, v23

    .line 1697
    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Lcom/google/android/mms/pdu/PduPart;->setDate(J)V

    .line 1699
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1700
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1701
    goto/16 :goto_0

    .line 1717
    .end local v5           #date:J
    :sswitch_4
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x111002b

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1720
    .local v2, contentDisposition:Z
    if-eqz v2, :cond_3

    .line 1721
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    move-result v10

    .line 1722
    .local v10, len:I
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1723
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v17

    .line 1724
    .local v17, thisStartPos:I
    const/16 v16, 0x0

    .line 1725
    .local v16, thisEndPos:I
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v19

    .line 1727
    .local v19, value:I
    const/16 v21, 0x80

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_a

    .line 1728
    sget-object v21, Lcom/google/android/mms/pdu/PduPart;->DISPOSITION_FROM_DATA:[B

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setContentDisposition([B)V

    .line 1741
    :goto_2
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v16

    .line 1742
    sub-int v21, v17, v16

    move/from16 v0, v21

    if-ge v0, v10, :cond_9

    .line 1743
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v19

    .line 1744
    const/16 v21, 0x98

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_8

    .line 1745
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setFilename([B)V

    .line 1750
    :cond_8
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v16

    .line 1751
    sub-int v21, v17, v16

    move/from16 v0, v21

    if-ge v0, v10, :cond_9

    .line 1752
    sub-int v21, v17, v16

    sub-int v8, v10, v21

    .line 1753
    .local v8, last:I
    new-array v12, v8, [B

    .line 1754
    .local v12, temp:[B
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v12, v1, v8}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 1758
    .end local v8           #last:I
    .end local v12           #temp:[B
    :cond_9
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1759
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1760
    goto/16 :goto_0

    .line 1729
    :cond_a
    const/16 v21, 0x81

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_b

    .line 1730
    sget-object v21, Lcom/google/android/mms/pdu/PduPart;->DISPOSITION_ATTACHMENT:[B

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setContentDisposition([B)V

    goto :goto_2

    .line 1731
    :cond_b
    const/16 v21, 0x82

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 1732
    sget-object v21, Lcom/google/android/mms/pdu/PduPart;->DISPOSITION_INLINE:[B

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setContentDisposition([B)V

    goto :goto_2

    .line 1734
    :cond_c
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1736
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduPart;->setContentDisposition([B)V

    goto/16 :goto_2

    .line 1770
    .end local v2           #contentDisposition:Z
    .end local v10           #len:I
    .end local v16           #thisEndPos:I
    .end local v17           #thisStartPos:I
    .end local v19           #value:I
    :cond_d
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 1773
    :cond_e
    const/16 v21, 0x20

    move/from16 v0, v21

    if-lt v7, v0, :cond_14

    const/16 v21, 0x7f

    move/from16 v0, v21

    if-gt v7, v0, :cond_14

    .line 1775
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 1776
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v13

    .line 1777
    .local v13, tempHeader:[B
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v15

    .line 1779
    .local v15, tempValue:[B
    new-instance v18, Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-direct {v0, v13}, Ljava/lang/String;-><init>([B)V

    .line 1781
    .local v18, unAssignedHeader:Ljava/lang/String;
    const-string v21, "PduParser"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Got unknown header field: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1782
    const-string v21, "PduParser"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Got unknown header tempValue: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    new-instance v23, Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-direct {v0, v15}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1784
    const/16 v21, 0x1

    const-string v22, "Content-Transfer-Encoding"

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_f

    .line 1786
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/google/android/mms/pdu/PduPart;->setContentTransferEncoding([B)V

    .line 1790
    :cond_f
    const/16 v21, 0x1

    const-string v22, "Content-ID"

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_10

    .line 1792
    if-eqz v15, :cond_10

    .line 1793
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/google/android/mms/pdu/PduPart;->setContentId([B)V

    .line 1798
    :cond_10
    const/16 v21, 0x1

    const-string v22, "Content-Location"

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_11

    .line 1800
    if-eqz v15, :cond_11

    .line 1801
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/google/android/mms/pdu/PduPart;->setContentLocation([B)V

    .line 1806
    :cond_11
    const/16 v21, 0x1

    const-string v22, "Content-Disposition"

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_12

    .line 1808
    if-eqz v15, :cond_12

    .line 1809
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/google/android/mms/pdu/PduPart;->setContentDisposition([B)V

    .line 1814
    :cond_12
    const/16 v21, 0x1

    const-string v22, "Name"

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_13

    .line 1816
    if-eqz v15, :cond_13

    .line 1817
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/google/android/mms/pdu/PduPart;->setName([B)V

    .line 1821
    :cond_13
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v14

    .line 1822
    sub-int v21, v11, v14

    sub-int v9, p2, v21

    .line 1823
    goto/16 :goto_0

    .line 1825
    .end local v13           #tempHeader:[B
    .end local v15           #tempValue:[B
    .end local v18           #unAssignedHeader:Ljava/lang/String;
    :cond_14
    const-string v21, "PduParser"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Not supported Part headers: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1828
    const/16 v21, -0x1

    move-object/from16 v0, p0

    invoke-static {v0, v9}, Lcom/google/android/mms/pdu/PduParser;->skipWapValue(Ljava/io/ByteArrayInputStream;I)I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_15

    .line 1829
    const-string v21, "PduParser"

    const-string v22, "Corrupt Part headers"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1830
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 1832
    :cond_15
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 1836
    .end local v7           #header:I
    :cond_16
    if-eqz v9, :cond_17

    .line 1837
    const-string v21, "PduParser"

    const-string v22, "Corrupt Part headers"

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1838
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 1841
    :cond_17
    const/16 v21, 0x1

    goto/16 :goto_1

    .line 1657
    nop

    :sswitch_data_0
    .sparse-switch
        0x8e -> :sswitch_0
        0x92 -> :sswitch_3
        0xae -> :sswitch_4
        0xb0 -> :sswitch_2
        0xc0 -> :sswitch_1
        0xc5 -> :sswitch_4
    .end sparse-switch
.end method

.method protected static parseParts(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/PduBody;
    .locals 23
    .parameter "pduDataStream"

    .prologue
    .line 821
    if-nez p0, :cond_1

    .line 822
    const/4 v3, 0x0

    .line 930
    :cond_0
    :goto_0
    return-object v3

    .line 825
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseUnsignedInt(Ljava/io/ByteArrayInputStream;)I

    move-result v7

    .line 826
    .local v7, count:I
    new-instance v3, Lcom/google/android/mms/pdu/PduBody;

    invoke-direct {v3}, Lcom/google/android/mms/pdu/PduBody;-><init>()V

    .line 828
    .local v3, body:Lcom/google/android/mms/pdu/PduBody;
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    if-ge v12, v7, :cond_0

    .line 829
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseUnsignedInt(Ljava/io/ByteArrayInputStream;)I

    move-result v11

    .line 830
    .local v11, headerLength:I
    invoke-static/range {p0 .. p0}, Lcom/google/android/mms/pdu/PduParser;->parseUnsignedInt(Ljava/io/ByteArrayInputStream;)I

    move-result v8

    .line 831
    .local v8, dataLength:I
    new-instance v15, Lcom/google/android/mms/pdu/PduPart;

    invoke-direct {v15}, Lcom/google/android/mms/pdu/PduPart;-><init>()V

    .line 832
    .local v15, part:Lcom/google/android/mms/pdu/PduPart;
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v20

    .line 833
    .local v20, startPos:I
    if-gtz v20, :cond_2

    .line 835
    const-string v21, "PduParser"

    const-string v22, "PduParser: parseParts: Invalid part."

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    const/4 v3, 0x0

    goto :goto_0

    .line 840
    :cond_2
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 841
    .local v13, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lcom/google/android/mms/pdu/PduParser;->parseContentType(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;)[B

    move-result-object v6

    .line 842
    .local v6, contentType:[B
    if-eqz v6, :cond_5

    .line 843
    invoke-virtual {v15, v6}, Lcom/google/android/mms/pdu/PduPart;->setContentType([B)V

    .line 849
    :goto_2
    const/16 v21, 0x97

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [B

    move-object/from16 v14, v21

    check-cast v14, [B

    .line 850
    .local v14, name:[B
    if-eqz v14, :cond_3

    .line 851
    invoke-virtual {v15, v14}, Lcom/google/android/mms/pdu/PduPart;->setName([B)V

    .line 855
    :cond_3
    const/16 v21, 0x81

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 856
    .local v4, charset:Ljava/lang/Integer;
    if-eqz v4, :cond_4

    .line 857
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/google/android/mms/pdu/PduPart;->setCharset(I)V

    .line 861
    :cond_4
    invoke-virtual/range {p0 .. p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v10

    .line 862
    .local v10, endPos:I
    sub-int v21, v20, v10

    sub-int v19, v11, v21

    .line 863
    .local v19, partHeaderLen:I
    if-lez v19, :cond_6

    .line 864
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-static {v0, v15, v1}, Lcom/google/android/mms/pdu/PduParser;->parsePartHeaders(Ljava/io/ByteArrayInputStream;Lcom/google/android/mms/pdu/PduPart;I)Z

    move-result v21

    if-nez v21, :cond_7

    .line 866
    const-string v21, "PduParser"

    const-string v22, "PduParser: parseParts: Parse part header faild."

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 867
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 845
    .end local v4           #charset:Ljava/lang/Integer;
    .end local v10           #endPos:I
    .end local v14           #name:[B
    .end local v19           #partHeaderLen:I
    :cond_5
    sget-object v21, Lcom/google/android/mms/pdu/PduContentTypes;->contentTypes:[Ljava/lang/String;

    const/16 v22, 0x0

    aget-object v21, v21, v22

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->getBytes()[B

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/google/android/mms/pdu/PduPart;->setContentType([B)V

    goto :goto_2

    .line 869
    .restart local v4       #charset:Ljava/lang/Integer;
    .restart local v10       #endPos:I
    .restart local v14       #name:[B
    .restart local v19       #partHeaderLen:I
    :cond_6
    if-gez v19, :cond_7

    .line 871
    const-string v21, "PduParser"

    const-string v22, "PduParser: parseParts: Invalid length of content-type"

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 878
    :cond_7
    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getContentLocation()[B

    move-result-object v21

    if-nez v21, :cond_8

    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getName()[B

    move-result-object v21

    if-nez v21, :cond_8

    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getFilename()[B

    move-result-object v21

    if-nez v21, :cond_8

    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getContentId()[B

    move-result-object v21

    if-nez v21, :cond_8

    .line 882
    const-string v21, "PduParser"

    const-string v22, "PduParser: parseParts: Hasn\'t find ContentLocation,so generate one."

    invoke-static/range {v21 .. v22}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 883
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->toOctalString(J)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->getBytes()[B

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/google/android/mms/pdu/PduPart;->setContentLocation([B)V

    .line 888
    :cond_8
    if-lez v8, :cond_9

    .line 889
    new-array v0, v8, [B

    move-object/from16 v17, v0

    .line 890
    .local v17, partData:[B
    new-instance v16, Ljava/lang/String;

    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getContentType()[B

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 891
    .local v16, partContentType:Ljava/lang/String;
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2, v8}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 892
    const-string v21, "application/vnd.wap.multipart.alternative"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 894
    new-instance v21, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static/range {v21 .. v21}, Lcom/google/android/mms/pdu/PduParser;->parseParts(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/PduBody;

    move-result-object v5

    .line 896
    .local v5, childBody:Lcom/google/android/mms/pdu/PduBody;
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Lcom/google/android/mms/pdu/PduBody;->getPart(I)Lcom/google/android/mms/pdu/PduPart;

    move-result-object v15

    .line 921
    .end local v5           #childBody:Lcom/google/android/mms/pdu/PduBody;
    .end local v16           #partContentType:Ljava/lang/String;
    .end local v17           #partData:[B
    :cond_9
    :goto_3
    invoke-static {v15}, Lcom/google/android/mms/pdu/PduParser;->checkPartPosition(Lcom/google/android/mms/pdu/PduPart;)I

    move-result v21

    if-nez v21, :cond_e

    .line 923
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v3, v0, v15}, Lcom/google/android/mms/pdu/PduBody;->addPart(ILcom/google/android/mms/pdu/PduPart;)V

    .line 828
    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_1

    .line 899
    .restart local v16       #partContentType:Ljava/lang/String;
    .restart local v17       #partData:[B
    :cond_a
    invoke-virtual {v15}, Lcom/google/android/mms/pdu/PduPart;->getContentTransferEncoding()[B

    move-result-object v18

    .line 900
    .local v18, partDataEncoding:[B
    if-eqz v18, :cond_b

    .line 901
    new-instance v9, Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Ljava/lang/String;-><init>([B)V

    .line 902
    .local v9, encoding:Ljava/lang/String;
    const-string v21, "base64"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_c

    .line 904
    invoke-static/range {v17 .. v17}, Lcom/google/android/mms/pdu/Base64;->decodeBase64([B)[B

    move-result-object v17

    .line 912
    .end local v9           #encoding:Ljava/lang/String;
    :cond_b
    :goto_5
    if-nez v17, :cond_d

    .line 913
    const-string v21, "Decode part data error!"

    invoke-static/range {v21 .. v21}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 914
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 905
    .restart local v9       #encoding:Ljava/lang/String;
    :cond_c
    const-string/jumbo v21, "quoted-printable"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_b

    .line 907
    invoke-static/range {v17 .. v17}, Lcom/google/android/mms/pdu/QuotedPrintable;->decodeQuotedPrintable([B)[B

    move-result-object v17

    goto :goto_5

    .line 916
    .end local v9           #encoding:Ljava/lang/String;
    :cond_d
    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lcom/google/android/mms/pdu/PduPart;->setData([B)V

    goto :goto_3

    .line 926
    .end local v16           #partContentType:Ljava/lang/String;
    .end local v17           #partData:[B
    .end local v18           #partDataEncoding:[B
    :cond_e
    invoke-virtual {v3, v15}, Lcom/google/android/mms/pdu/PduBody;->addPart(Lcom/google/android/mms/pdu/PduPart;)Z

    goto :goto_4
.end method

.method protected static parseShortInteger(Ljava/io/ByteArrayInputStream;)I
    .locals 2
    .parameter "pduDataStream"

    .prologue
    .line 1233
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1234
    :cond_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v0

    .line 1235
    .local v0, temp:I
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-ne v1, v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1236
    :cond_1
    and-int/lit8 v1, v0, 0x7f

    return v1
.end method

.method protected static parseUnsignedInt(Ljava/io/ByteArrayInputStream;)I
    .locals 4
    .parameter "pduDataStream"

    .prologue
    const/4 v3, -0x1

    .line 956
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 957
    :cond_0
    const/4 v0, 0x0

    .line 958
    .local v0, result:I
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    .line 959
    .local v1, temp:I
    if-ne v1, v3, :cond_1

    move v2, v1

    .line 975
    :goto_0
    return v2

    .line 963
    :cond_1
    and-int/lit16 v2, v1, 0x80

    if-eqz v2, :cond_2

    .line 964
    shl-int/lit8 v0, v0, 0x7

    .line 965
    and-int/lit8 v2, v1, 0x7f

    or-int/2addr v0, v2

    .line 966
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    .line 967
    if-ne v1, v3, :cond_1

    move v2, v1

    .line 968
    goto :goto_0

    .line 972
    :cond_2
    shl-int/lit8 v0, v0, 0x7

    .line 973
    and-int/lit8 v2, v1, 0x7f

    or-int/2addr v0, v2

    move v2, v0

    .line 975
    goto :goto_0
.end method

.method protected static parseValueLength(Ljava/io/ByteArrayInputStream;)I
    .locals 4
    .parameter "pduDataStream"

    .prologue
    .line 993
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 994
    :cond_0
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v1

    .line 995
    .local v1, temp:I
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    const/4 v2, -0x1

    if-ne v2, v1, :cond_1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 996
    :cond_1
    and-int/lit16 v0, v1, 0xff

    .line 998
    .local v0, first:I
    const/16 v2, 0x1e

    if-gt v0, v2, :cond_2

    .line 1001
    .end local v0           #first:I
    :goto_0
    return v0

    .line 1000
    .restart local v0       #first:I
    :cond_2
    const/16 v2, 0x1f

    if-ne v0, v2, :cond_3

    .line 1001
    invoke-static {p0}, Lcom/google/android/mms/pdu/PduParser;->parseUnsignedInt(Ljava/io/ByteArrayInputStream;)I

    move-result v0

    goto :goto_0

    .line 1004
    :cond_3
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Value length > LENGTH_QUOTE!"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected static parseWapString(Ljava/io/ByteArrayInputStream;I)[B
    .locals 3
    .parameter "pduDataStream"
    .parameter "stringType"

    .prologue
    const/4 v2, 0x1

    .line 1057
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1075
    :cond_0
    invoke-virtual {p0, v2}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1078
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v0

    .line 1079
    .local v0, temp:I
    sget-boolean v1, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    const/4 v1, -0x1

    if-ne v1, v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1080
    :cond_1
    if-ne v2, p1, :cond_2

    const/16 v1, 0x22

    if-ne v1, v0, :cond_2

    .line 1083
    invoke-virtual {p0, v2}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 1098
    :goto_0
    invoke-static {p0, p1}, Lcom/google/android/mms/pdu/PduParser;->getWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v1

    return-object v1

    .line 1084
    :cond_2
    if-nez p1, :cond_3

    const/16 v1, 0x7f

    if-ne v1, v0, :cond_3

    .line 1087
    invoke-virtual {p0, v2}, Ljava/io/ByteArrayInputStream;->mark(I)V

    goto :goto_0

    .line 1090
    :cond_3
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->reset()V

    goto :goto_0
.end method

.method protected static skipWapValue(Ljava/io/ByteArrayInputStream;I)I
    .locals 3
    .parameter "pduDataStream"
    .parameter "length"

    .prologue
    .line 1308
    sget-boolean v2, Lcom/google/android/mms/pdu/PduParser;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1309
    :cond_0
    new-array v0, p1, [B

    .line 1310
    .local v0, area:[B
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p1}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v1

    .line 1311
    .local v1, readLen:I
    if-ge v1, p1, :cond_1

    .line 1312
    const/4 v1, -0x1

    .line 1314
    .end local v1           #readLen:I
    :cond_1
    return v1
.end method


# virtual methods
.method public parse()Lcom/google/android/mms/pdu/GenericPdu;
    .locals 27

    .prologue
    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    if-nez v24, :cond_1

    .line 121
    const-string v24, "PduParser"

    const-string v25, "Input parse stream is null"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    const/16 v18, 0x0

    .line 269
    :cond_0
    :goto_0
    return-object v18

    .line 126
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseHeaders(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/PduHeaders;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    if-nez v24, :cond_2

    .line 129
    const-string v24, "PduParser"

    const-string v25, "Parse PduHeader Failed"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const/16 v18, 0x0

    goto :goto_0

    .line 134
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    const/16 v25, 0x8c

    invoke-virtual/range {v24 .. v25}, Lcom/google/android/mms/pdu/PduHeaders;->getOctet(I)I

    move-result v10

    .line 137
    .local v10, messageType:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/google/android/mms/pdu/PduParser;->checkMandatoryHeader(Lcom/google/android/mms/pdu/PduHeaders;)Z

    move-result v24

    if-nez v24, :cond_3

    .line 138
    const-string v24, "check mandatory headers failed!"

    invoke-static/range {v24 .. v24}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 139
    const/16 v18, 0x0

    goto :goto_0

    .line 141
    :cond_3
    const/16 v24, 0x84

    move/from16 v0, v24

    if-ne v0, v10, :cond_6

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    const/16 v25, 0x84

    invoke-virtual/range {v24 .. v25}, Lcom/google/android/mms/pdu/PduHeaders;->getTextString(I)[B

    move-result-object v4

    .line 144
    .local v4, contentType:[B
    if-nez v4, :cond_4

    .line 145
    const-string v24, "PduParser"

    const-string v25, "Parse MESSAGE_TYPE_RETRIEVE_CONF Failed: content Type is null"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const/16 v18, 0x0

    goto :goto_0

    .line 148
    :cond_4
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([B)V

    .line 149
    .local v5, contentTypeStr:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 150
    const-string v24, "application/vnd.wap.multipart.mixed"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    const-string v24, "application/vnd.wap.multipart.related"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    const-string v24, "application/vnd.wap.multipart.alternative"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 153
    const-string/jumbo v24, "text/plain"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 154
    const-string v24, "PduParser"

    const-string v25, "Content Type is text/plain"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    new-instance v23, Lcom/google/android/mms/pdu/PduPart;

    invoke-direct/range {v23 .. v23}, Lcom/google/android/mms/pdu/PduPart;-><init>()V

    .line 157
    .local v23, theOnlyPart:Lcom/google/android/mms/pdu/PduPart;
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lcom/google/android/mms/pdu/PduPart;->setContentType([B)V

    .line 158
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->toOctalString(J)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->getBytes()[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/google/android/mms/pdu/PduPart;->setContentLocation([B)V

    .line 160
    const-string v24, "<part1>"

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->getBytes()[B

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lcom/google/android/mms/pdu/PduPart;->setContentId([B)V

    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    invoke-virtual/range {v24 .. v25}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 164
    const/4 v15, 0x0

    .line 165
    .local v15, partDataLen:I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/ByteArrayInputStream;->read()I

    move-result v24

    const/16 v25, -0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_5

    .line 166
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 169
    :cond_5
    new-array v14, v15, [B

    .line 170
    .local v14, partData:[B
    const-string v24, "PduParser"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "got part length: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v0, v14, v1, v15}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 173
    new-instance v22, Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-direct {v0, v14}, Ljava/lang/String;-><init>([B)V

    .line 174
    .local v22, showData:Ljava/lang/String;
    const-string v24, "PduParser"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v26, "show data: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Lcom/google/android/mms/pdu/PduPart;->setData([B)V

    .line 177
    const-string v24, "PduParser"

    const-string/jumbo v25, "setData finish"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    new-instance v13, Lcom/google/android/mms/pdu/PduBody;

    invoke-direct {v13}, Lcom/google/android/mms/pdu/PduBody;-><init>()V

    .line 179
    .local v13, onlyPartBody:Lcom/google/android/mms/pdu/PduBody;
    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Lcom/google/android/mms/pdu/PduBody;->addPart(Lcom/google/android/mms/pdu/PduPart;)Z

    .line 180
    const/16 v18, 0x0

    .line 182
    .local v18, retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    :try_start_0
    new-instance v19, Lcom/google/android/mms/pdu/RetrieveConf;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v13}, Lcom/google/android/mms/pdu/RetrieveConf;-><init>(Lcom/google/android/mms/pdu/PduHeaders;Lcom/google/android/mms/pdu/PduBody;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v18           #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    .local v19, retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    move-object/from16 v18, v19

    .line 186
    .end local v19           #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    .restart local v18       #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    :goto_2
    if-nez v18, :cond_0

    .line 187
    const-string v24, "PduParser"

    const-string/jumbo v25, "retrieveConf is null"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 183
    :catch_0
    move-exception v8

    .line 184
    .local v8, e:Ljava/lang/Exception;
    const-string v24, "PduParser"

    const-string/jumbo v25, "new RetrieveConf has exception"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 197
    .end local v4           #contentType:[B
    .end local v5           #contentTypeStr:Ljava/lang/String;
    .end local v8           #e:Ljava/lang/Exception;
    .end local v13           #onlyPartBody:Lcom/google/android/mms/pdu/PduBody;
    .end local v14           #partData:[B
    .end local v15           #partDataLen:I
    .end local v18           #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    .end local v22           #showData:Ljava/lang/String;
    .end local v23           #theOnlyPart:Lcom/google/android/mms/pdu/PduPart;
    :cond_6
    const/16 v24, 0x80

    move/from16 v0, v24

    if-eq v0, v10, :cond_7

    const/16 v24, 0x84

    move/from16 v0, v24

    if-ne v0, v10, :cond_8

    .line 200
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mPduDataStream:Ljava/io/ByteArrayInputStream;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lcom/google/android/mms/pdu/PduParser;->parseParts(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/PduBody;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v24, v0

    if-nez v24, :cond_8

    .line 203
    const-string v24, "PduParser"

    const-string v25, "Parse parts Failed"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 208
    :cond_8
    packed-switch v10, :pswitch_data_0

    .line 268
    const-string v24, "Parser doesn\'t support this message type in this version!"

    invoke-static/range {v24 .. v24}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 269
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 210
    :pswitch_0
    new-instance v21, Lcom/google/android/mms/pdu/SendReq;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v25, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/google/android/mms/pdu/SendReq;-><init>(Lcom/google/android/mms/pdu/PduHeaders;Lcom/google/android/mms/pdu/PduBody;)V

    .local v21, sendReq:Lcom/google/android/mms/pdu/SendReq;
    move-object/from16 v18, v21

    .line 211
    goto/16 :goto_0

    .line 213
    .end local v21           #sendReq:Lcom/google/android/mms/pdu/SendReq;
    :pswitch_1
    new-instance v20, Lcom/google/android/mms/pdu/SendConf;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/google/android/mms/pdu/SendConf;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v20, sendConf:Lcom/google/android/mms/pdu/SendConf;
    move-object/from16 v18, v20

    .line 214
    goto/16 :goto_0

    .line 216
    .end local v20           #sendConf:Lcom/google/android/mms/pdu/SendConf;
    :pswitch_2
    new-instance v11, Lcom/google/android/mms/pdu/NotificationInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v11, v0}, Lcom/google/android/mms/pdu/NotificationInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v11, notificationInd:Lcom/google/android/mms/pdu/NotificationInd;
    move-object/from16 v18, v11

    .line 218
    goto/16 :goto_0

    .line 220
    .end local v11           #notificationInd:Lcom/google/android/mms/pdu/NotificationInd;
    :pswitch_3
    new-instance v12, Lcom/google/android/mms/pdu/NotifyRespInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v12, v0}, Lcom/google/android/mms/pdu/NotifyRespInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v12, notifyRespInd:Lcom/google/android/mms/pdu/NotifyRespInd;
    move-object/from16 v18, v12

    .line 222
    goto/16 :goto_0

    .line 224
    .end local v12           #notifyRespInd:Lcom/google/android/mms/pdu/NotifyRespInd;
    :pswitch_4
    new-instance v18, Lcom/google/android/mms/pdu/RetrieveConf;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v25, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/google/android/mms/pdu/RetrieveConf;-><init>(Lcom/google/android/mms/pdu/PduHeaders;Lcom/google/android/mms/pdu/PduBody;)V

    .line 227
    .restart local v18       #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    invoke-virtual/range {v18 .. v18}, Lcom/google/android/mms/pdu/RetrieveConf;->getContentType()[B

    move-result-object v4

    .line 228
    .restart local v4       #contentType:[B
    if-nez v4, :cond_9

    .line 229
    const-string v24, "PduParser"

    const-string v25, "Parse MESSAGE_TYPE_RETRIEVE_CONF Failed: content Type is null"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 232
    :cond_9
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v4}, Ljava/lang/String;-><init>([B)V

    .line 233
    .local v6, ctTypeStr:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 234
    const-string v24, "application/vnd.wap.multipart.mixed"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    const-string v24, "application/vnd.wap.multipart.related"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    const-string v24, "application/vnd.wap.multipart.alternative"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    .line 241
    const-string v24, "application/vnd.wap.multipart.alternative"

    move-object/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_a

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/google/android/mms/pdu/PduBody;->getPart(I)Lcom/google/android/mms/pdu/PduPart;

    move-result-object v9

    .line 245
    .local v9, firstPart:Lcom/google/android/mms/pdu/PduPart;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/google/android/mms/pdu/PduBody;->removeAll()V

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mBody:Lcom/google/android/mms/pdu/PduBody;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v0, v1, v9}, Lcom/google/android/mms/pdu/PduBody;->addPart(ILcom/google/android/mms/pdu/PduPart;)V

    goto/16 :goto_0

    .line 249
    .end local v9           #firstPart:Lcom/google/android/mms/pdu/PduPart;
    :cond_a
    const-string v24, "PduParser"

    const-string v25, "Parse MESSAGE_TYPE_RETRIEVE_CONF Failed: content Type is null"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 252
    .end local v4           #contentType:[B
    .end local v6           #ctTypeStr:Ljava/lang/String;
    .end local v18           #retrieveConf:Lcom/google/android/mms/pdu/RetrieveConf;
    :pswitch_5
    new-instance v7, Lcom/google/android/mms/pdu/DeliveryInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v7, v0}, Lcom/google/android/mms/pdu/DeliveryInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v7, deliveryInd:Lcom/google/android/mms/pdu/DeliveryInd;
    move-object/from16 v18, v7

    .line 254
    goto/16 :goto_0

    .line 256
    .end local v7           #deliveryInd:Lcom/google/android/mms/pdu/DeliveryInd;
    :pswitch_6
    new-instance v3, Lcom/google/android/mms/pdu/AcknowledgeInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v3, v0}, Lcom/google/android/mms/pdu/AcknowledgeInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v3, acknowledgeInd:Lcom/google/android/mms/pdu/AcknowledgeInd;
    move-object/from16 v18, v3

    .line 258
    goto/16 :goto_0

    .line 260
    .end local v3           #acknowledgeInd:Lcom/google/android/mms/pdu/AcknowledgeInd;
    :pswitch_7
    new-instance v16, Lcom/google/android/mms/pdu/ReadOrigInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/google/android/mms/pdu/ReadOrigInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v16, readOrigInd:Lcom/google/android/mms/pdu/ReadOrigInd;
    move-object/from16 v18, v16

    .line 262
    goto/16 :goto_0

    .line 264
    .end local v16           #readOrigInd:Lcom/google/android/mms/pdu/ReadOrigInd;
    :pswitch_8
    new-instance v17, Lcom/google/android/mms/pdu/ReadRecInd;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/mms/pdu/PduParser;->mHeaders:Lcom/google/android/mms/pdu/PduHeaders;

    move-object/from16 v24, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/google/android/mms/pdu/ReadRecInd;-><init>(Lcom/google/android/mms/pdu/PduHeaders;)V

    .local v17, readRecInd:Lcom/google/android/mms/pdu/ReadRecInd;
    move-object/from16 v18, v17

    .line 266
    goto/16 :goto_0

    .line 208
    nop

    :pswitch_data_0
    .packed-switch 0x80
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method public parse(Z)Lcom/google/android/mms/pdu/GenericPdu;
    .locals 1
    .parameter "forRestore"

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/google/android/mms/pdu/PduParser;->mForRestore:Z

    .line 110
    invoke-virtual {p0}, Lcom/google/android/mms/pdu/PduParser;->parse()Lcom/google/android/mms/pdu/GenericPdu;

    move-result-object v0

    return-object v0
.end method

.method protected parseHeaders(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/PduHeaders;
    .locals 31
    .parameter "pduDataStream"

    .prologue
    .line 280
    if-nez p1, :cond_1

    .line 281
    const/4 v11, 0x0

    .line 811
    :cond_0
    :goto_0
    return-object v11

    .line 284
    :cond_1
    const/4 v12, 0x1

    .line 285
    .local v12, keepParsing:Z
    new-instance v11, Lcom/google/android/mms/pdu/PduHeaders;

    invoke-direct {v11}, Lcom/google/android/mms/pdu/PduHeaders;-><init>()V

    .line 287
    .local v11, headers:Lcom/google/android/mms/pdu/PduHeaders;
    :cond_2
    :goto_1
    if-eqz v12, :cond_0

    invoke-virtual/range {p1 .. p1}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v27

    if-lez v27, :cond_0

    .line 288
    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 289
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v10

    .line 291
    .local v10, headerField:I
    const/16 v27, 0x20

    move/from16 v0, v27

    if-lt v10, v0, :cond_3

    const/16 v27, 0x7f

    move/from16 v0, v27

    if-gt v10, v0, :cond_3

    .line 292
    invoke-virtual/range {p1 .. p1}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 293
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v4

    .line 295
    .local v4, bVal:[B
    const-string v27, "PduParser"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "TextHeader: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    new-instance v29, Ljava/lang/String;

    move-object/from16 v0, v29

    invoke-direct {v0, v4}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 300
    .end local v4           #bVal:[B
    :cond_3
    packed-switch v10, :pswitch_data_0

    .line 806
    :pswitch_0
    const-string v27, "Unknown header"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 303
    :pswitch_1
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v16

    .line 304
    .local v16, messageType:I
    packed-switch v16, :pswitch_data_1

    .line 325
    :try_start_0
    move/from16 v0, v16

    invoke-virtual {v11, v0, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setOctet(II)V
    :try_end_0
    .catch Lcom/google/android/mms/InvalidHeaderValueException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 326
    :catch_0
    move-exception v6

    .line 327
    .local v6, e:Lcom/google/android/mms/InvalidHeaderValueException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Set invalid Octet value: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " into the header filed: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 329
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 321
    .end local v6           #e:Lcom/google/android/mms/InvalidHeaderValueException;
    :pswitch_2
    const-string v27, "PduParser"

    const-string v28, "PduParser: parseHeaders: We don\'t support these kind of messages now."

    invoke-static/range {v27 .. v28}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 330
    :catch_1
    move-exception v6

    .line 331
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Octet header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 332
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 365
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v16           #messageType:I
    :pswitch_3
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v24

    .line 368
    .local v24, value:I
    :try_start_1
    move/from16 v0, v24

    invoke-virtual {v11, v0, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setOctet(II)V
    :try_end_1
    .catch Lcom/google/android/mms/InvalidHeaderValueException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_3

    goto/16 :goto_1

    .line 369
    :catch_2
    move-exception v6

    .line 370
    .local v6, e:Lcom/google/android/mms/InvalidHeaderValueException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Set invalid Octet value: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " into the header filed: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 372
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 373
    .end local v6           #e:Lcom/google/android/mms/InvalidHeaderValueException;
    :catch_3
    move-exception v6

    .line 374
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Octet header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 375
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 386
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v24           #value:I
    :pswitch_4
    :try_start_2
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseLongInteger(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v24

    .line 392
    .local v24, value:J
    const/16 v27, 0x85

    move/from16 v0, v27

    if-ne v10, v0, :cond_4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/mms/pdu/PduParser;->mForRestore:Z

    move/from16 v27, v0

    if-nez v27, :cond_4

    .line 393
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    const-wide/16 v29, 0x3e8

    div-long v24, v27, v29

    .line 395
    :cond_4
    move-wide/from16 v0, v24

    invoke-virtual {v11, v0, v1, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setLongInteger(JI)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_4

    goto/16 :goto_1

    .line 396
    .end local v24           #value:J
    :catch_4
    move-exception v6

    .line 397
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Long-Integer header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 398
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 409
    .end local v6           #e:Ljava/lang/RuntimeException;
    :pswitch_5
    :try_start_3
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseIntegerValue(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v24

    .line 410
    .restart local v24       #value:J
    move-wide/from16 v0, v24

    invoke-virtual {v11, v0, v1, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setLongInteger(JI)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_5

    goto/16 :goto_1

    .line 411
    .end local v24           #value:J
    :catch_5
    move-exception v6

    .line 412
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Long-Integer header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 413
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 439
    .end local v6           #e:Ljava/lang/RuntimeException;
    :pswitch_6
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v24

    .line 440
    .local v24, value:[B
    if-eqz v24, :cond_2

    .line 442
    :try_start_4
    move-object/from16 v0, v24

    invoke-virtual {v11, v0, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_7

    goto/16 :goto_1

    .line 443
    :catch_6
    move-exception v6

    .line 444
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 445
    .end local v6           #e:Ljava/lang/NullPointerException;
    :catch_7
    move-exception v6

    .line 446
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Text-String header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 447
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 463
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v24           #value:[B
    :pswitch_7
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v24

    .line 465
    .local v24, value:Lcom/google/android/mms/pdu/EncodedStringValue;
    if-eqz v24, :cond_2

    .line 467
    :try_start_5
    move-object/from16 v0, v24

    invoke-virtual {v11, v0, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setEncodedStringValue(Lcom/google/android/mms/pdu/EncodedStringValue;I)V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_9

    goto/16 :goto_1

    .line 468
    :catch_8
    move-exception v6

    .line 469
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 470
    .end local v6           #e:Ljava/lang/NullPointerException;
    :catch_9
    move-exception v6

    .line 471
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Encoded-String-Value header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 472
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 483
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v24           #value:Lcom/google/android/mms/pdu/EncodedStringValue;
    :pswitch_8
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v24

    .line 485
    .restart local v24       #value:Lcom/google/android/mms/pdu/EncodedStringValue;
    if-eqz v24, :cond_2

    .line 486
    invoke-virtual/range {v24 .. v24}, Lcom/google/android/mms/pdu/EncodedStringValue;->getTextString()[B

    move-result-object v3

    .line 487
    .local v3, address:[B
    if-eqz v3, :cond_6

    .line 488
    new-instance v20, Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 489
    .local v20, str:Ljava/lang/String;
    const-string v27, "/"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 490
    .local v7, endIndex:I
    if-lez v7, :cond_5

    .line 491
    const/16 v27, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 494
    :cond_5
    :try_start_6
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/google/android/mms/pdu/EncodedStringValue;->setTextString([B)V
    :try_end_6
    .catch Ljava/lang/NullPointerException; {:try_start_6 .. :try_end_6} :catch_b

    .line 502
    .end local v7           #endIndex:I
    .end local v20           #str:Ljava/lang/String;
    :cond_6
    :try_start_7
    move-object/from16 v0, v24

    invoke-virtual {v11, v0, v10}, Lcom/google/android/mms/pdu/PduHeaders;->appendEncodedStringValue(Lcom/google/android/mms/pdu/EncodedStringValue;I)V
    :try_end_7
    .catch Ljava/lang/NullPointerException; {:try_start_7 .. :try_end_7} :catch_a
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_c

    goto/16 :goto_1

    .line 503
    :catch_a
    move-exception v6

    .line 504
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 495
    .end local v6           #e:Ljava/lang/NullPointerException;
    .restart local v7       #endIndex:I
    .restart local v20       #str:Ljava/lang/String;
    :catch_b
    move-exception v6

    .line 496
    .restart local v6       #e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 497
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 505
    .end local v6           #e:Ljava/lang/NullPointerException;
    .end local v7           #endIndex:I
    .end local v20           #str:Ljava/lang/String;
    :catch_c
    move-exception v6

    .line 506
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Encoded-String-Value header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 507
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 520
    .end local v3           #address:[B
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v24           #value:Lcom/google/android/mms/pdu/EncodedStringValue;
    :pswitch_9
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 523
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v23

    .line 528
    .local v23, token:I
    :try_start_8
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseLongInteger(Ljava/io/ByteArrayInputStream;)J
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_e

    move-result-wide v21

    .line 533
    .local v21, timeValue:J
    const/16 v27, 0x81

    move/from16 v0, v27

    move/from16 v1, v23

    if-ne v0, v1, :cond_7

    .line 536
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v27

    const-wide/16 v29, 0x3e8

    div-long v27, v27, v29

    add-long v21, v21, v27

    .line 540
    :cond_7
    :try_start_9
    move-wide/from16 v0, v21

    invoke-virtual {v11, v0, v1, v10}, Lcom/google/android/mms/pdu/PduHeaders;->setLongInteger(JI)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_d

    goto/16 :goto_1

    .line 541
    :catch_d
    move-exception v6

    .line 542
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Long-Integer header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 543
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 529
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v21           #timeValue:J
    :catch_e
    move-exception v6

    .line 530
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Long-Integer header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 531
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 553
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v23           #token:I
    :pswitch_a
    const/4 v8, 0x0

    .line 554
    .local v8, from:Lcom/google/android/mms/pdu/EncodedStringValue;
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 557
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v9

    .line 560
    .local v9, fromToken:I
    const/16 v27, 0x80

    move/from16 v0, v27

    if-ne v0, v9, :cond_a

    .line 562
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v8

    .line 563
    if-eqz v8, :cond_9

    .line 564
    invoke-virtual {v8}, Lcom/google/android/mms/pdu/EncodedStringValue;->getTextString()[B

    move-result-object v3

    .line 565
    .restart local v3       #address:[B
    if-eqz v3, :cond_9

    .line 566
    new-instance v20, Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>([B)V

    .line 567
    .restart local v20       #str:Ljava/lang/String;
    const-string v27, "/"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 568
    .restart local v7       #endIndex:I
    if-lez v7, :cond_8

    .line 569
    const/16 v27, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v27

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 572
    :cond_8
    :try_start_a
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Lcom/google/android/mms/pdu/EncodedStringValue;->setTextString([B)V
    :try_end_a
    .catch Ljava/lang/NullPointerException; {:try_start_a .. :try_end_a} :catch_10

    .line 590
    .end local v3           #address:[B
    .end local v7           #endIndex:I
    .end local v20           #str:Ljava/lang/String;
    :cond_9
    :goto_2
    const/16 v27, 0x89

    :try_start_b
    move/from16 v0, v27

    invoke-virtual {v11, v8, v0}, Lcom/google/android/mms/pdu/PduHeaders;->setEncodedStringValue(Lcom/google/android/mms/pdu/EncodedStringValue;I)V
    :try_end_b
    .catch Ljava/lang/NullPointerException; {:try_start_b .. :try_end_b} :catch_f
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_12

    goto/16 :goto_1

    .line 591
    :catch_f
    move-exception v6

    .line 592
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 573
    .end local v6           #e:Ljava/lang/NullPointerException;
    .restart local v3       #address:[B
    .restart local v7       #endIndex:I
    .restart local v20       #str:Ljava/lang/String;
    :catch_10
    move-exception v6

    .line 574
    .restart local v6       #e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 575
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 581
    .end local v3           #address:[B
    .end local v6           #e:Ljava/lang/NullPointerException;
    .end local v7           #endIndex:I
    .end local v20           #str:Ljava/lang/String;
    :cond_a
    :try_start_c
    new-instance v8, Lcom/google/android/mms/pdu/EncodedStringValue;

    .end local v8           #from:Lcom/google/android/mms/pdu/EncodedStringValue;
    const-string v27, "insert-address-token"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    move-object/from16 v0, v27

    invoke-direct {v8, v0}, Lcom/google/android/mms/pdu/EncodedStringValue;-><init>([B)V
    :try_end_c
    .catch Ljava/lang/NullPointerException; {:try_start_c .. :try_end_c} :catch_11

    .restart local v8       #from:Lcom/google/android/mms/pdu/EncodedStringValue;
    goto :goto_2

    .line 583
    .end local v8           #from:Lcom/google/android/mms/pdu/EncodedStringValue;
    :catch_11
    move-exception v6

    .line 584
    .restart local v6       #e:Ljava/lang/NullPointerException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Encoded-String-Value header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 585
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 593
    .end local v6           #e:Ljava/lang/NullPointerException;
    .restart local v8       #from:Lcom/google/android/mms/pdu/EncodedStringValue;
    :catch_12
    move-exception v6

    .line 594
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Encoded-String-Value header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 595
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 602
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v8           #from:Lcom/google/android/mms/pdu/EncodedStringValue;
    .end local v9           #fromToken:I
    :pswitch_b
    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayInputStream;->mark(I)V

    .line 603
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    move-result v14

    .line 605
    .local v14, messageClass:I
    const/16 v27, 0x80

    move/from16 v0, v27

    if-lt v14, v0, :cond_e

    .line 608
    const/16 v27, 0x80

    move/from16 v0, v27

    if-ne v0, v14, :cond_b

    .line 609
    :try_start_d
    const-string/jumbo v27, "personal"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    const/16 v28, 0x8a

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_d .. :try_end_d} :catch_13
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_14

    goto/16 :goto_1

    .line 625
    :catch_13
    move-exception v6

    .line 626
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 612
    .end local v6           #e:Ljava/lang/NullPointerException;
    :cond_b
    const/16 v27, 0x81

    move/from16 v0, v27

    if-ne v0, v14, :cond_c

    .line 613
    :try_start_e
    const-string v27, "advertisement"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    const/16 v28, 0x8a

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_e
    .catch Ljava/lang/NullPointerException; {:try_start_e .. :try_end_e} :catch_13
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_14

    goto/16 :goto_1

    .line 627
    :catch_14
    move-exception v6

    .line 628
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Text-String header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 629
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 616
    .end local v6           #e:Ljava/lang/RuntimeException;
    :cond_c
    const/16 v27, 0x82

    move/from16 v0, v27

    if-ne v0, v14, :cond_d

    .line 617
    :try_start_f
    const-string v27, "informational"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    const/16 v28, 0x8a

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V

    goto/16 :goto_1

    .line 620
    :cond_d
    const/16 v27, 0x83

    move/from16 v0, v27

    if-ne v0, v14, :cond_2

    .line 621
    const-string v27, "auto"

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->getBytes()[B

    move-result-object v27

    const/16 v28, 0x8a

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_f
    .catch Ljava/lang/NullPointerException; {:try_start_f .. :try_end_f} :catch_13
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_14

    goto/16 :goto_1

    .line 633
    :cond_e
    invoke-virtual/range {p1 .. p1}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 634
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseWapString(Ljava/io/ByteArrayInputStream;I)[B

    move-result-object v15

    .line 635
    .local v15, messageClassString:[B
    if-eqz v15, :cond_2

    .line 637
    const/16 v27, 0x8a

    :try_start_10
    move/from16 v0, v27

    invoke-virtual {v11, v15, v0}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_10
    .catch Ljava/lang/NullPointerException; {:try_start_10 .. :try_end_10} :catch_15
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_16

    goto/16 :goto_1

    .line 638
    :catch_15
    move-exception v6

    .line 639
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 640
    .end local v6           #e:Ljava/lang/NullPointerException;
    :catch_16
    move-exception v6

    .line 641
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Text-String header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 642
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 650
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v14           #messageClass:I
    .end local v15           #messageClassString:[B
    :pswitch_c
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseShortInteger(Ljava/io/ByteArrayInputStream;)I

    move-result v26

    .line 653
    .local v26, version:I
    const/16 v27, 0x8d

    :try_start_11
    move/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setOctet(II)V
    :try_end_11
    .catch Lcom/google/android/mms/InvalidHeaderValueException; {:try_start_11 .. :try_end_11} :catch_17
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_18

    goto/16 :goto_1

    .line 654
    :catch_17
    move-exception v6

    .line 655
    .local v6, e:Lcom/google/android/mms/InvalidHeaderValueException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Set invalid Octet value: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " into the header filed: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 657
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 658
    .end local v6           #e:Lcom/google/android/mms/InvalidHeaderValueException;
    :catch_18
    move-exception v6

    .line 659
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Octet header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 660
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 669
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v26           #version:I
    :pswitch_d
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 673
    :try_start_12
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseIntegerValue(Ljava/io/ByteArrayInputStream;)J
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_1a

    .line 680
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;

    move-result-object v19

    .line 682
    .local v19, previouslySentBy:Lcom/google/android/mms/pdu/EncodedStringValue;
    if-eqz v19, :cond_2

    .line 684
    const/16 v27, 0xa0

    :try_start_13
    move-object/from16 v0, v19

    move/from16 v1, v27

    invoke-virtual {v11, v0, v1}, Lcom/google/android/mms/pdu/PduHeaders;->setEncodedStringValue(Lcom/google/android/mms/pdu/EncodedStringValue;I)V
    :try_end_13
    .catch Ljava/lang/NullPointerException; {:try_start_13 .. :try_end_13} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_1b

    goto/16 :goto_1

    .line 686
    :catch_19
    move-exception v6

    .line 687
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 674
    .end local v6           #e:Ljava/lang/NullPointerException;
    .end local v19           #previouslySentBy:Lcom/google/android/mms/pdu/EncodedStringValue;
    :catch_1a
    move-exception v6

    .line 675
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " is not Integer-Value"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 676
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 688
    .end local v6           #e:Ljava/lang/RuntimeException;
    .restart local v19       #previouslySentBy:Lcom/google/android/mms/pdu/EncodedStringValue;
    :catch_1b
    move-exception v6

    .line 689
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Encoded-String-Value header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 690
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 700
    .end local v6           #e:Ljava/lang/RuntimeException;
    .end local v19           #previouslySentBy:Lcom/google/android/mms/pdu/EncodedStringValue;
    :pswitch_e
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 704
    :try_start_14
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseIntegerValue(Ljava/io/ByteArrayInputStream;)J
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_1d

    .line 712
    :try_start_15
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseLongInteger(Ljava/io/ByteArrayInputStream;)J

    move-result-wide v17

    .line 713
    .local v17, perviouslySentDate:J
    const/16 v27, 0xa1

    move-wide/from16 v0, v17

    move/from16 v2, v27

    invoke-virtual {v11, v0, v1, v2}, Lcom/google/android/mms/pdu/PduHeaders;->setLongInteger(JI)V
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_1c

    goto/16 :goto_1

    .line 715
    .end local v17           #perviouslySentDate:J
    :catch_1c
    move-exception v6

    .line 716
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Long-Integer header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 717
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 705
    .end local v6           #e:Ljava/lang/RuntimeException;
    :catch_1d
    move-exception v6

    .line 706
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " is not Integer-Value"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 707
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 730
    .end local v6           #e:Ljava/lang/RuntimeException;
    :pswitch_f
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 733
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    .line 736
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseEncodedStringValue(Ljava/io/ByteArrayInputStream;)Lcom/google/android/mms/pdu/EncodedStringValue;

    goto/16 :goto_1

    .line 749
    :pswitch_10
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseValueLength(Ljava/io/ByteArrayInputStream;)I

    .line 752
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->extractByteValue(Ljava/io/ByteArrayInputStream;)I

    .line 756
    :try_start_16
    invoke-static/range {p1 .. p1}, Lcom/google/android/mms/pdu/PduParser;->parseIntegerValue(Ljava/io/ByteArrayInputStream;)J
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_1e

    goto/16 :goto_1

    .line 757
    :catch_1e
    move-exception v6

    .line 758
    .restart local v6       #e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, " is not Integer-Value"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 759
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 768
    .end local v6           #e:Ljava/lang/RuntimeException;
    :pswitch_11
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lcom/google/android/mms/pdu/PduParser;->parseContentType(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;)[B

    goto/16 :goto_1

    .line 776
    :pswitch_12
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 778
    .local v13, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lcom/google/android/mms/pdu/PduParser;->parseContentType(Ljava/io/ByteArrayInputStream;Ljava/util/HashMap;)[B

    move-result-object v5

    .line 781
    .local v5, contentType:[B
    if-eqz v5, :cond_f

    .line 783
    const/16 v27, 0x84

    :try_start_17
    move/from16 v0, v27

    invoke-virtual {v11, v5, v0}, Lcom/google/android/mms/pdu/PduHeaders;->setTextString([BI)V
    :try_end_17
    .catch Ljava/lang/NullPointerException; {:try_start_17 .. :try_end_17} :catch_1f
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_17} :catch_20

    .line 793
    :cond_f
    :goto_3
    const/16 v27, 0x99

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, [B

    check-cast v27, [B

    sput-object v27, Lcom/google/android/mms/pdu/PduParser;->mStartParam:[B

    .line 796
    const/16 v27, 0x83

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, [B

    check-cast v27, [B

    sput-object v27, Lcom/google/android/mms/pdu/PduParser;->mTypeParam:[B

    .line 798
    const/4 v12, 0x0

    .line 799
    goto/16 :goto_1

    .line 784
    :catch_1f
    move-exception v6

    .line 785
    .local v6, e:Ljava/lang/NullPointerException;
    const-string/jumbo v27, "null pointer error!"

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    goto :goto_3

    .line 786
    .end local v6           #e:Ljava/lang/NullPointerException;
    :catch_20
    move-exception v6

    .line 787
    .local v6, e:Ljava/lang/RuntimeException;
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, "is not Text-String header field!"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lcom/google/android/mms/pdu/PduParser;->log(Ljava/lang/String;)V

    .line 788
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 300
    nop

    :pswitch_data_0
    .packed-switch 0x81
        :pswitch_8
        :pswitch_8
        :pswitch_6
        :pswitch_12
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_6
        :pswitch_1
        :pswitch_c
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_7
        :pswitch_3
        :pswitch_3
        :pswitch_7
        :pswitch_8
        :pswitch_6
        :pswitch_3
        :pswitch_7
        :pswitch_3
        :pswitch_3
        :pswitch_9
        :pswitch_6
        :pswitch_4
        :pswitch_d
        :pswitch_e
        :pswitch_3
        :pswitch_3
        :pswitch_f
        :pswitch_3
        :pswitch_7
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_10
        :pswitch_3
        :pswitch_10
        :pswitch_5
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_3
        :pswitch_11
        :pswitch_5
        :pswitch_3
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_6
        :pswitch_6
        :pswitch_3
    .end packed-switch

    .line 304
    :pswitch_data_1
    .packed-switch 0x89
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

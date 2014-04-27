.class Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
.super Ljava/lang/Thread;
.source "MtkAgpsManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/agps/MtkAgpsManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MtkAgpsIO"
.end annotation


# instance fields
.field private buf:[B

.field private mDin:Ljava/io/DataInputStream;

.field private mEnabled:Z

.field private mId:I

.field private mOut:Ljava/io/OutputStream;

.field private mSocket:Landroid/net/LocalSocket;

.field private mSocketName:Ljava/lang/String;

.field private mTyp:I

.field final synthetic this$0:Lcom/mediatek/agps/MtkAgpsManagerService;


# direct methods
.method public constructor <init>(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V
    .locals 2
    .parameter
    .parameter "socket_name"

    .prologue
    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 1504
    iput-object p1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1496
    iput v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    .line 1497
    iput v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    .line 1498
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mEnabled:Z

    .line 1499
    iput-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    .line 1500
    iput-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    .line 1501
    iput-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    .line 1502
    iput-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    .line 1505
    iput-object p2, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    .line 1506
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    .line 1507
    return-void
.end method


# virtual methods
.method public IsOutputReady()Z
    .locals 2

    .prologue
    .line 1668
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    if-nez v0, :cond_0

    .line 1669
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v1, "ERR: OutputStream is not ready!!"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->loge(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$800(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1670
    const/4 v0, 0x0

    .line 1672
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public connectSocket()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    .line 1688
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    if-eqz v3, :cond_0

    .line 1689
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "socket ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") has already been connected.."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1714
    :goto_0
    return v2

    .line 1694
    :cond_0
    :try_start_0
    new-instance v3, Landroid/net/LocalSocket;

    invoke-direct {v3}, Landroid/net/LocalSocket;-><init>()V

    iput-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    .line 1695
    new-instance v0, Landroid/net/LocalSocketAddress;

    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    sget-object v4, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    invoke-direct {v0, v3, v4}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 1698
    .local v0, addr:Landroid/net/LocalSocketAddress;
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "before connect to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1699
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v3, v0}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    .line 1700
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "afer connect to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1702
    new-instance v3, Ljava/io/BufferedOutputStream;

    iget-object v4, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v4}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    const/16 v5, 0x200

    invoke-direct {v3, v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    .line 1703
    new-instance v3, Ljava/io/DataInputStream;

    iget-object v4, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v4}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    .line 1705
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIsBootCompleted:Z
    invoke-static {v3}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$400(Lcom/mediatek/agps/MtkAgpsManagerService;)Z

    move-result v3

    if-ne v3, v2, :cond_1

    .line 1706
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$1200(Lcom/mediatek/agps/MtkAgpsManagerService;)Landroid/content/Context;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.mediatek.agps.toast"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1713
    :cond_1
    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    iput-boolean v2, v3, Lcom/mediatek/agps/MtkAgpsManagerService;->mIsSocketOK:Z

    goto/16 :goto_0

    .line 1708
    .end local v0           #addr:Landroid/net/LocalSocketAddress;
    :catch_0
    move-exception v1

    .line 1709
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 1710
    invoke-virtual {p0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->disconnSocket()V

    .line 1711
    const/4 v2, 0x0

    goto/16 :goto_0
.end method

.method public disconnSocket()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1718
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disconnSocket "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocketName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1720
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V

    .line 1721
    :cond_0
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 1722
    :cond_1
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1726
    :cond_2
    :goto_0
    iput-object v4, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mSocket:Landroid/net/LocalSocket;

    .line 1727
    iput-object v4, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    .line 1728
    iput-object v4, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    .line 1729
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/mediatek/agps/MtkAgpsManagerService;->mIsSocketOK:Z

    .line 1730
    return-void

    .line 1723
    :catch_0
    move-exception v0

    .line 1724
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public flush()V
    .locals 2

    .prologue
    .line 1676
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    if-eqz v1, :cond_0

    .line 1678
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1683
    :cond_0
    :goto_0
    return-void

    .line 1679
    :catch_0
    move-exception v0

    .line 1680
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public final readFully([B)V
    .locals 3
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1784
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1785
    return-void
.end method

.method public final readFully([BII)V
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1788
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1789
    return-void
.end method

.method public final readInt()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1774
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1775
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v1, 0x3

    aget-byte v0, v0, v1

    shl-int/lit8 v0, v0, 0x18

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v2, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v2, 0x1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    aget-byte v1, v1, v3

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public final readShort()S
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1779
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1780
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    const/4 v1, 0x1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->buf:[B

    aget-byte v1, v1, v3

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public run()V
    .locals 18

    .prologue
    .line 1510
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mEnabled:Z

    if-eqz v15, :cond_d

    .line 1512
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string/jumbo v16, "reading.."

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1513
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIO:Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3100(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;

    move-result-object v15

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->readInt()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    .line 1514
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIO:Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3100(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;

    move-result-object v15

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->readInt()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    .line 1515
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIO:Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3100(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;

    move-result-object v15

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->readInt()I

    move-result v3

    .line 1516
    .local v3, field_2:I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIO:Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3100(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;

    move-result-object v15

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->readInt()I

    move-result v4

    .line 1517
    .local v4, field_3:I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIO:Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3100(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;

    move-result-object v15

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->readInt()I

    move-result v5

    .line 1519
    .local v5, field_4:I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "cmd="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " f1="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " f2="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " f3="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " f4="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1521
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    sparse-switch v15, :sswitch_data_0

    .line 1609
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "ERR: recv unknow data from agpsd value="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1612
    .end local v3           #field_2:I
    .end local v4           #field_3:I
    .end local v5           #field_4:I
    :catch_0
    move-exception v1

    .line 1613
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1614
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const/16 v16, 0x0

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/mediatek/agps/MtkAgpsManagerService;->mIsSocketOK:Z

    .line 1615
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->disconnSocket()V

    .line 1617
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "before waiting 1500 ms"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1618
    const-wide/16 v15, 0x5dc

    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->sleep(J)V

    .line 1619
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "after waiting 1500 ms"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_3

    .line 1624
    :goto_1
    const/4 v7, 0x0

    .line 1625
    .local v7, isSuccess:Z
    const/4 v11, 0x0

    .line 1627
    .local v11, reconnect_num:I
    :cond_1
    :goto_2
    if-nez v7, :cond_a

    const/16 v15, 0xa

    if-ge v11, v15, :cond_a

    .line 1628
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->connectSocket()Z

    move-result v7

    .line 1629
    add-int/lit8 v11, v11, 0x1

    .line 1631
    if-nez v7, :cond_1

    .line 1632
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "reconnected to Socket fail, reconnect times is: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1634
    const-wide/16 v15, 0x3e8

    :try_start_2
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 1635
    :catch_1
    move-exception v2

    .line 1636
    .local v2, ex:Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 1523
    .end local v1           #e:Ljava/lang/Exception;
    .end local v2           #ex:Ljava/lang/InterruptedException;
    .end local v7           #isSuccess:Z
    .end local v11           #reconnect_num:I
    .restart local v3       #field_2:I
    .restart local v4       #field_3:I
    .restart local v5       #field_4:I
    :sswitch_0
    :try_start_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "read AGPS_IND_EM_MODE: Id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1524
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->sendNotify(II)V
    invoke-static/range {v15 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3200(Lcom/mediatek/agps/MtkAgpsManagerService;II)V

    goto/16 :goto_0

    .line 1528
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "read AGPS_IND_VERIFY: Id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1529
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->sendNotify(II)V
    invoke-static/range {v15 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3200(Lcom/mediatek/agps/MtkAgpsManagerService;II)V

    goto/16 :goto_0

    .line 1533
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "read AGPS_IND_NOTIFY: Id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " len1="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " len2="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1534
    const/4 v15, -0x1

    if-eq v3, v15, :cond_3

    if-eqz v3, :cond_3

    .line 1535
    new-array v13, v3, [B

    .line 1536
    .local v13, tempbuf2:[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    if-eqz v15, :cond_2

    .line 1537
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v15, v13, v0, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1539
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Ljava/lang/String;-><init>([B)V

    #setter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mRequestId:Ljava/lang/String;
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3302(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)Ljava/lang/String;

    .line 1540
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "request id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v17, v0

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mRequestId:Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3300(Lcom/mediatek/agps/MtkAgpsManagerService;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1542
    .end local v13           #tempbuf2:[B
    :cond_3
    const/4 v15, -0x1

    if-eq v4, v15, :cond_5

    if-eqz v4, :cond_5

    .line 1543
    new-array v14, v4, [B

    .line 1544
    .local v14, tempbuf3:[B
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    if-eqz v15, :cond_4

    .line 1545
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mDin:Ljava/io/DataInputStream;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v15, v14, v0, v4}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 1547
    :cond_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Ljava/lang/String;-><init>([B)V

    #setter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mClientName:Ljava/lang/String;
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3402(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)Ljava/lang/String;

    .line 1548
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "client name="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v17, v0

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mClientName:Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3400(Lcom/mediatek/agps/MtkAgpsManagerService;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1550
    .end local v14           #tempbuf3:[B
    :cond_5
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_6

    .line 1551
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->sendNotify(II)V
    invoke-static/range {v15 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3200(Lcom/mediatek/agps/MtkAgpsManagerService;II)V

    .line 1553
    :cond_6
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-eq v15, v0, :cond_7

    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    const/16 v16, 0x3

    move/from16 v0, v16

    if-ne v15, v0, :cond_8

    .line 1555
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->sendVerify(II)V
    invoke-static/range {v15 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3500(Lcom/mediatek/agps/MtkAgpsManagerService;II)V

    .line 1557
    :cond_8
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    const/16 v16, 0x4

    move/from16 v0, v16

    if-ne v15, v0, :cond_0

    .line 1558
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mIsGPSStart:Z
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$200(Lcom/mediatek/agps/MtkAgpsManagerService;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 1559
    new-instance v6, Landroid/content/Intent;

    const-string v15, "android.location.PRIVACY_OVERWRITE"

    invoke-direct {v6, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1560
    .local v6, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mContext:Landroid/content/Context;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$1200(Lcom/mediatek/agps/MtkAgpsManagerService;)Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v15, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1566
    .end local v6           #intent:Landroid/content/Intent;
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "read AGPS_IND_ERROR: Id="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1567
    move-object/from16 v0, p0

    iget v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    const/16 v16, 0xf

    move/from16 v0, v16

    if-ne v15, v0, :cond_9

    .line 1568
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "WARNING: Modem reset happens !"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1569
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mStatus:Z
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3600(Lcom/mediatek/agps/MtkAgpsManagerService;)Z

    move-result v12

    .line 1571
    .local v12, status:Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->disable()V

    .line 1572
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->disableNilr()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1575
    :try_start_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "before waiting 500 ms"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1576
    const-wide/16 v15, 0x1f4

    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->sleep(J)V

    .line 1577
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "after waiting 500 ms "

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 1582
    :goto_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->enableNilr()I

    .line 1584
    const/4 v15, 0x1

    if-ne v12, v15, :cond_0

    .line 1585
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->enable()V

    goto/16 :goto_0

    .line 1578
    :catch_2
    move-exception v1

    .line 1579
    .local v1, e:Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3

    .line 1588
    .end local v1           #e:Ljava/lang/InterruptedException;
    .end local v12           #status:Z
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mTyp:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mId:I

    move/from16 v17, v0

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->sendError(II)V
    invoke-static/range {v15 .. v17}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3700(Lcom/mediatek/agps/MtkAgpsManagerService;II)V

    goto/16 :goto_0

    .line 1592
    :sswitch_4
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v8

    .line 1593
    .local v8, msg1:Landroid/os/Message;
    const/16 v15, 0x457

    iput v15, v8, Landroid/os/Message;->what:I

    .line 1594
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$100(Lcom/mediatek/agps/MtkAgpsManagerService;)Landroid/os/Handler;

    move-result-object v15

    invoke-virtual {v15, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 1598
    .end local v8           #msg1:Landroid/os/Message;
    :sswitch_5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v9

    .line 1599
    .local v9, msg2:Landroid/os/Message;
    const/16 v15, 0x8ae

    iput v15, v9, Landroid/os/Message;->what:I

    .line 1600
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$100(Lcom/mediatek/agps/MtkAgpsManagerService;)Landroid/os/Handler;

    move-result-object v15

    invoke-virtual {v15, v9}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 1604
    .end local v9           #msg2:Landroid/os/Message;
    :sswitch_6
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v10

    .line 1605
    .local v10, msg3:Landroid/os/Message;
    const/16 v15, 0x15b3

    iput v15, v10, Landroid/os/Message;->what:I

    .line 1606
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$100(Lcom/mediatek/agps/MtkAgpsManagerService;)Landroid/os/Handler;

    move-result-object v15

    invoke-virtual {v15, v10}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 1620
    .end local v3           #field_2:I
    .end local v4           #field_3:I
    .end local v5           #field_4:I
    .end local v10           #msg3:Landroid/os/Message;
    .local v1, e:Ljava/lang/Exception;
    :catch_3
    move-exception v2

    .line 1621
    .restart local v2       #ex:Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 1640
    .end local v2           #ex:Ljava/lang/InterruptedException;
    .restart local v7       #isSuccess:Z
    .restart local v11       #reconnect_num:I
    :cond_a
    if-nez v7, :cond_b

    .line 1641
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "ERR: reconnected to Socket fail!  MtkAgpsManagerService thread forced to exit!"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1642
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mEnabled:Z

    .line 1643
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const/16 v16, 0x0

    #setter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mStatus:Z
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3602(Lcom/mediatek/agps/MtkAgpsManagerService;Z)Z

    goto/16 :goto_0

    .line 1645
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const/16 v16, 0x1

    move/from16 v0, v16

    iput-boolean v0, v15, Lcom/mediatek/agps/MtkAgpsManagerService;->mIsSocketOK:Z

    .line 1646
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string/jumbo v16, "reconnected to Socket OK!   Initialize mtk_agpsd\'s Status !"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1648
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    move-object/from16 v16, v0

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mConfig:Lcom/mediatek/agps/MtkAgpsConfig;
    invoke-static/range {v16 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$1700(Lcom/mediatek/agps/MtkAgpsManagerService;)Lcom/mediatek/agps/MtkAgpsConfig;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->setConfig(Lcom/mediatek/agps/MtkAgpsConfig;)V

    .line 1650
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->enableNilr()I

    .line 1652
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #getter for: Lcom/mediatek/agps/MtkAgpsManagerService;->mStatus:Z
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3600(Lcom/mediatek/agps/MtkAgpsManagerService;)Z

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    .line 1653
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    invoke-virtual {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->enable()V

    .line 1655
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->updateNetworkAndSIM()V
    invoke-static {v15}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$3800(Lcom/mediatek/agps/MtkAgpsManagerService;)V

    goto/16 :goto_0

    .line 1659
    .end local v1           #e:Ljava/lang/Exception;
    .end local v7           #isSuccess:Z
    .end local v11           #reconnect_num:I
    :cond_d
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v16, "ERR: exit while loop, agpsd cannot be connected"

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static/range {v15 .. v16}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1660
    return-void

    .line 1521
    nop

    :sswitch_data_0
    .sparse-switch
        0x457 -> :sswitch_0
        0x8ae -> :sswitch_1
        0xd05 -> :sswitch_2
        0x115c -> :sswitch_3
        0x2328 -> :sswitch_4
        0x2329 -> :sswitch_5
        0x232a -> :sswitch_6
    .end sparse-switch
.end method

.method public stopReading()V
    .locals 2

    .prologue
    .line 1663
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mEnabled:Z

    .line 1664
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->this$0:Lcom/mediatek/agps/MtkAgpsManagerService;

    const-string v1, "WARNING: MtkAgpsIO will stop reading.."

    #calls: Lcom/mediatek/agps/MtkAgpsManagerService;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/agps/MtkAgpsManagerService;->access$000(Lcom/mediatek/agps/MtkAgpsManagerService;Ljava/lang/String;)V

    .line 1665
    return-void
.end method

.method public writeByte(I)V
    .locals 1
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1736
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1737
    return-void
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 2
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1740
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 1741
    return-void
.end method

.method public writeBytes([B)V
    .locals 1
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1744
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 1745
    return-void
.end method

.method public writeDouble(D)V
    .locals 2
    .parameter "d"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1748
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeLong(J)V

    .line 1749
    return-void
.end method

.method public writeFloat(F)V
    .locals 1
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1752
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeInt(I)V

    .line 1753
    return-void
.end method

.method public writeInt(I)V
    .locals 2
    .parameter "i"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v1, 0xffff

    .line 1756
    and-int v0, p1, v1

    invoke-virtual {p0, v0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeShort(I)V

    .line 1757
    shr-int/lit8 v0, p1, 0x10

    and-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeShort(I)V

    .line 1758
    return-void
.end method

.method public writeLong(J)V
    .locals 4
    .parameter "l"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 1761
    and-long v0, p1, v2

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeInt(I)V

    .line 1762
    const/16 v0, 0x20

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->writeInt(I)V

    .line 1763
    return-void
.end method

.method public writeShort(I)V
    .locals 2
    .parameter "i"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1766
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    and-int/lit16 v1, p1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 1767
    iget-object v0, p0, Lcom/mediatek/agps/MtkAgpsManagerService$MtkAgpsIO;->mOut:Ljava/io/OutputStream;

    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 1768
    return-void
.end method

.class Landroid/webkit/WebTextView$1;
.super Landroid/os/Handler;
.source "WebTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/webkit/WebTextView;-><init>(Landroid/content/Context;Landroid/webkit/WebView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/webkit/WebTextView;


# direct methods
.method constructor <init>(Landroid/webkit/WebTextView;)V
    .locals 0
    .parameter

    .prologue
    .line 206
    iput-object p1, p0, Landroid/webkit/WebTextView$1;->this$0:Landroid/webkit/WebTextView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 209
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 214
    :goto_0
    return-void

    .line 211
    :pswitch_0
    iget-object v0, p0, Landroid/webkit/WebTextView$1;->this$0:Landroid/webkit/WebTextView;

    #getter for: Landroid/webkit/WebTextView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v0}, Landroid/webkit/WebTextView;->access$000(Landroid/webkit/WebTextView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/WebTextView$1;->this$0:Landroid/webkit/WebTextView;

    #getter for: Landroid/webkit/WebTextView;->mQueryId:I
    invoke-static {v1}, Landroid/webkit/WebTextView;->access$100(Landroid/webkit/WebTextView;)I

    move-result v1

    iget-object v2, p0, Landroid/webkit/WebTextView$1;->this$0:Landroid/webkit/WebTextView;

    #getter for: Landroid/webkit/WebTextView;->mNodePointer:I
    invoke-static {v2}, Landroid/webkit/WebTextView;->access$200(Landroid/webkit/WebTextView;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->autoFillForm(II)V

    goto :goto_0

    .line 209
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method

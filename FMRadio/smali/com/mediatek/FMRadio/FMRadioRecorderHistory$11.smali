.class Lcom/mediatek/FMRadio/FMRadioRecorderHistory$11;
.super Ljava/lang/Object;
.source "FMRadioRecorderHistory.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioRecorderHistory;->prepareAttr()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioRecorderHistory;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioRecorderHistory;)V
    .locals 0
    .parameter

    .prologue
    .line 1335
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioRecorderHistory$11;->this$0:Lcom/mediatek/FMRadio/FMRadioRecorderHistory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1337
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 1338
    return-void
.end method

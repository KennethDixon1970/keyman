inherited frameCEFHost: TframeCEFHost
  Left = 193
  Top = 131
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = ''
  ClientHeight = 645
  ClientWidth = 878
  OldCreateOrder = True
  OnDestroy = FormDestroy
  ExplicitWidth = 878
  ExplicitHeight = 645
  PixelsPerInch = 96
  TextHeight = 13
  object cefwp: TCEFWindowParent
    Left = 0
    Top = 0
    Width = 878
    Height = 645
    Align = alClient
    TabOrder = 0
  end
  object tmrRefresh: TTimer
    Enabled = False
    Left = 604
    Top = 48
  end
  object tmrCreateBrowser: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmrCreateBrowserTimer
    Left = 620
    Top = 208
  end
  object cef: TChromium
    OnLoadEnd = cefLoadEnd
    OnSetFocus = cefSetFocus
    OnRunContextMenu = cefRunContextMenu
    OnPreKeyEvent = cefPreKeyEvent
    OnConsoleMessage = cefConsoleMessage
    OnBeforePopup = cefBeforePopup
    OnAfterCreated = cefAfterCreated
    OnBeforeClose = cefBeforeClose
    OnClose = cefClose
    OnBeforeBrowse = cefBeforeBrowse
    Left = 424
    Top = 312
  end
end

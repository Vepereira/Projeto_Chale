object DM: TDM
  OldCreateOrder = False
  Height = 197
  Width = 390
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=VENANCIO\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Architect'
      'Workstation=VENANCIO\SQLEXPRESS'
      'DATABASE=Sistema'
      'MARS=yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 72
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'SERVER=VENANCIO\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Architect'
      'Workstation=VENANCIO'
      'DATABASE=Sistema'
      'MARS=yes'
      'DriverID=MSSQL')
    Left = 256
    Top = 32
  end
end

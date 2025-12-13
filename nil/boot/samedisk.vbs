#        ____                _           _   _           
#       / ___|_ __ ___  __ _| |_ ___  __| | | |__  _   _ 
#      | |   | '__/ _ \/ _` | __/ _ \/ _` | | '_ \| | | |
#      | |___| | |  __/ (_| | ||  __/ (_| | | |_) | |_| |
#       \____|_|  \___|\__,_|\__\___|\__,_| |_.__/ \__, |
#       ____  _ _         _____                    |___/ 
#      / ___|| (_)____   / ___ \                         
#      \___ \| | |_  /  / | _ \ \                        
#       ___) | | |/ /  |  |   /  |                       
#      |____/|_|_/___|  \ |_|_\ /                        
#                        \_____/ 

drive1 = ""
drive2 = ""
phys1 = ""
phys2 = ""

Set args = WScript.Arguments

if args.Length > 0 then
   drive1 = args.Item(0)
end if
if args.Length > 1 then
   drive2 = args.Item(1)
end if

if drive1 = "" then
   WScript.Quit(1)
end if

if drive2 = "" then
   WScript.Quit(2)
end if


ComputerName = "."
Set wmiServices = GetObject _
    ("winmgmts:{impersonationLevel=Impersonate}!//" & ComputerName)
Set wmiDiskDrives = wmiServices.ExecQuery _
    ("SELECT Caption, DeviceID FROM Win32_DiskDrive")

For Each wmiDiskDrive In wmiDiskDrives

    strEscapedDeviceID = _
        Replace(wmiDiskDrive.DeviceID, "\", "\\", 1, -1, vbTextCompare)
    Set wmiDiskPartitions = wmiServices.ExecQuery _
        ("ASSOCIATORS OF {Win32_DiskDrive.DeviceID=""" & _
            strEscapedDeviceID & """} WHERE " & _
                "AssocClass = Win32_DiskDriveToDiskPartition")
 
    For Each wmiDiskPartition In wmiDiskPartitions
        Set wmiLogicalDisks = wmiServices.ExecQuery _
            ("ASSOCIATORS OF {Win32_DiskPartition.DeviceID=""" & _
                wmiDiskPartition.DeviceID & """} WHERE " & _
                    "AssocClass = Win32_LogicalDiskToPartition")
 
        For Each wmiLogicalDisk In wmiLogicalDisks

            if UCase(Left(drive1,1)) = UCase(Left(wmiLogicalDisk.DeviceID,1)) then
               phys1=wmiDiskDrive.DeviceID
            end if

            if UCase(Left(drive2,1)) = UCase(Left(wmiLogicalDisk.DeviceID,1)) then
               phys2=wmiDiskDrive.DeviceID
            end if

        Next
    Next
Next

if phys1 = phys2 then
   WScript.Quit(99)
end if

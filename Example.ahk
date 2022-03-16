#Include, var_loader.ahk

global setting123 := new ini("test.ini")

MsgBox, % setting123.aaa.test1
MsgBox, % setting123.test.arere
aaa()
test2()
Return

aaa(){
for i,v in setting123.GetSetting(A_ThisFunc, o)
    %v%:=o[v]
MsgBox, % o.test2
MsgBox, % test3
MsgBox, % arere
}

test2(){
o := setting123.test
for i,v in setting123.test._List
    %v%:=o[v]
MsgBox, % arere
MsgBox, % umu
}

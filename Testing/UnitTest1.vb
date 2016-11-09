Imports System.Text
Imports Microsoft.VisualStudio.TestTools.UnitTesting

<TestClass()> Public Class UnitTest1

    <TestMethod()> Public Sub TestMethod1()
        'Dim fechaString = "2016-11-01"
        'Dim fecha As Date = Date.Parse(fechaString)
        'Console.WriteLine(fecha.Day.ToString & "-" & fecha.Month & "-" & fecha.Year)
        Dim temp = "1,2"
        Dim a = temp.Split(",")
        Console.Write(a(0))
    End Sub

End Class

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Title="DISPLAY LINK" Height="325" Width="180">
    <Grid>
        <Button Content="INSTALLER" HorizontalAlignment="Left" Margin="10,125.751,0,0" VerticalAlignment="Top" Width="150" Height="50" Name="BExamples1"/>
        <Button Content="DESINSTALLER" HorizontalAlignment="Left" Margin="10,180.751,0,0" VerticalAlignment="Top" Width="150" Height="50" Name="BExamples2"/>
        <TextBox HorizontalAlignment="Left" Height="30" Margin="10,32.309,0,0" TextWrapping="Wrap" Text="Saisir le nom du poste" VerticalAlignment="Top" Width="150" Name="TExamples1"/>
        <Button Content="Check" HorizontalAlignment="Left" Margin="43.828,67.309,0,0" VerticalAlignment="Top" Width="75" Name="BExamples3"/>
        <Button Content="Clean" HorizontalAlignment="Left" Margin="43.828,263.718,0,0" VerticalAlignment="Top" Width="75" Name="BExamples4"/>
        <Button Content="Check-Wifi" HorizontalAlignment="Left" Margin="43.828,92.269,0,0" VerticalAlignment="Top" Width="75" Name="BExamples5"/>
</Grid>
</Window>
"@

#-------------------------------------------------------------#
#----Control Event Handlers-----------------------------------#
#-------------------------------------------------------------#

function NFunction(){}


#endregion

#-------------------------------------------------------------#
#----Script Execution-----------------------------------------#
#-------------------------------------------------------------#

$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }

$BExamples1.IsEnabled = $false
$BDesinstaller.IsEnabled = $false

$BExamples1.Add_Click({FExamples1 $this $_})
$BExamples2.Add_Click({FExamples2 $this $_})
$BExamples3.Add_Click({FExamples3 $this $_})
$BExamples4.Add_Click({FExamples4 $this $_})
$BExamples5.Add_Click({FExamples5 $this $_})


[void]$Window.ShowDialog()
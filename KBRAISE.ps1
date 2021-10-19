
Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Title="KBRAISE" Height="138.228" Width="294.506">
    <Grid Background="#FF3B4549">
        <TextBox HorizontalAlignment="Left" Height="23" TextWrapping="Wrap" Text="Nom du poste" VerticalAlignment="Top" Width="120" Margin="10,10,0,0" Background="Gray" Name="TPoste"/>
        <TextBox HorizontalAlignment="Right" Height="23" TextWrapping="Wrap" Text="Utilisateur (Q5)" VerticalAlignment="Top" Width="120" Margin="138.345,10,10,0" Background="Gray" Name="TUser"/>
        <Button Content="Copier sur le bureau" HorizontalAlignment="Center" VerticalAlignment="Center" Width="132.512" Margin="76.997,74.098,76.997,10" Height="23.13" Name="BCopy"/>
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



$BCopy.Add_Click({FExamples1 $this $_})



[void]$Window.ShowDialog()
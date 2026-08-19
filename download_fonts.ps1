$Fonts = @(
    @{ Name = "Pacifico"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/pacifico/Pacifico-Regular.ttf"; File = "Pacifico-Regular.ttf" },
    @{ Name = "Lobster"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/lobster/Lobster-Regular.ttf"; File = "Lobster-Regular.ttf" },
    @{ Name = "Yellowtail"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/yellowtail/Yellowtail-Regular.ttf"; File = "Yellowtail-Regular.ttf" },
    @{ Name = "Great Vibes"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/greatvibes/GreatVibes-Regular.ttf"; File = "GreatVibes-Regular.ttf" },
    @{ Name = "Titan One"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/titanone/TitanOne-Regular.ttf"; File = "TitanOne-Regular.ttf" },
    @{ Name = "Fredoka One"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/fredokaone/FredokaOne-Regular.ttf"; File = "FredokaOne-Regular.ttf" },
    @{ Name = "Bebas Neue"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/bebasneue/BebasNeue-Regular.ttf"; File = "BebasNeue-Regular.ttf" },
    @{ Name = "Luckiest Guy"; Url = "https://raw.githubusercontent.com/google/fonts/main/apache/luckiestguy/LuckiestGuy-Regular.ttf"; File = "LuckiestGuy-Regular.ttf" },
    @{ Name = "Chewy"; Url = "https://raw.githubusercontent.com/google/fonts/main/apache/chewy/Chewy-Regular.ttf"; File = "Chewy-Regular.ttf" },
    @{ Name = "Cookie"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/cookie/Cookie-Regular.ttf"; File = "Cookie-Regular.ttf" },
    @{ Name = "Abril Fatface"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/abrilfatface/AbrilFatface-Regular.ttf"; File = "AbrilFatface-Regular.ttf" },
    @{ Name = "Permanent Marker"; Url = "https://raw.githubusercontent.com/google/fonts/main/apache/permanentmarker/PermanentMarker-Regular.ttf"; File = "PermanentMarker-Regular.ttf" },
    @{ Name = "Shrikhand"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/shrikhand/Shrikhand-Regular.ttf"; File = "Shrikhand-Regular.ttf" },
    @{ Name = "Oleo Script"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/oleoscript/OleoScript-Regular.ttf"; File = "OleoScript-Regular.ttf" },
    @{ Name = "Playfair Display"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/playfairdisplay/PlayfairDisplay-Black.ttf"; File = "PlayfairDisplay-Black.ttf" },
    @{ Name = "Black Han Sans"; Url = "https://raw.githubusercontent.com/google/fonts/main/ofl/blackhansans/BlackHanSans-Regular.ttf"; File = "BlackHanSans-Regular.ttf" }
)

$DestDir = "c:\Users\crack\Cutovi Studio\open-ttf-archive\fonts"

foreach ($Font in $Fonts) {
    $OutPath = Join-Path $DestDir $Font.File
    Write-Host "Downloading $($Font.Name)..."
    try {
        Invoke-WebRequest -Uri $Font.Url -OutFile $OutPath -ErrorAction Stop
        Write-Host "Successfully downloaded $($Font.Name)" -ForegroundColor Green
    } catch {
        Write-Host "Failed to download $($Font.Name): $_" -ForegroundColor Red
    }
}

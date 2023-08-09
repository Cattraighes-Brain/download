$source_urls = @(
    "https://raw.githubusercontent.com/Cattraighes-Brain/MDH-Downloader/main/MDHDownloader.z01",
    "https://raw.githubusercontent.com/Cattraighes-Brain/MDH-Downloader/main/MDHDownloader.z02",
    "https://raw.githubusercontent.com/Cattraighes-Brain/MDH-Downloader/main/MDHDownloader.zip"
)

$user_profile = [System.Environment]::GetFolderPath("UserProfile")
$target_folder = Join-Path $user_profile "AppData\Roaming\MDHDownloader"

foreach ($source_url in $source_urls) {
    $filename = [System.IO.Path]::GetFileName($source_url)
    $target_file = Join-Path $target_folder $filename

    if (-not (Test-Path -Path $target_file)) {
        $webClient = New-Object System.Net.WebClient
        $webClient.DownloadFile($source_url, $target_file)
    }
}

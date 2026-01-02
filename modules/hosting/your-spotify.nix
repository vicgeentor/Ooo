{
  flake.modules.nixos.your-spotify = nixosArgs: {
    age.secrets.your-spotify.file = ../../_secrets/your-spotify.age;
    services.your_spotify = {
      enable = true;
      enableLocalDB = true;
      spotifySecretFile = nixosArgs.config.age.secrets.your-spotify.path;
      settings = {
        SPOTIFY_PUBLIC = "11ce6df3ad974ebdb6c4d3c41728475b";
        API_ENDPOINT = "https://apispoti.vicgeentor.nl";
        CLIENT_ENDPOINT = "https://spoti.vicgeentor.nl";
        PORT = 8080;
      };
      nginxVirtualHost = "localhost:80";
    };
  };
}

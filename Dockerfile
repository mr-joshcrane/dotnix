FROM ubuntu

RUN useradd -m jcrane && echo "jcrane:jcrane" | chpasswd && adduser jcrane sudo
ENV USER=jcrane

# Install necessary dependencies for Nix
RUN apt-get update && apt-get install --no-install-recommends -y locales curl xz-utils ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir -m 0755 /nix && groupadd -r nixbld && chown jcrane /nix \
    && for n in $(seq 1 10); do useradd -c "Nix build user $n" -d /var/empty -g nixbld -G nixbld -M -N -r -s "$(command -v nologin)" "nixbld$n"; done

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN locale-gen en_US.UTF-8

RUN mkdir /etc/nix && echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
USER jcrane

# Install Nix
RUN set -eux && curl -L https://nixos.org/nix/install | bash &&\
         . "$HOME/.nix-profile/etc/profile.d/nix.sh" && nix-instantiate '<nixpkgs>' -A hello

# Set locale


RUN echo "source $HOME/.nix-profile/etc/profile.d/nix.sh" >> "$HOME/.bashrc" && \
    . "$HOME/.nix-profile/etc/profile.d/nix.sh" && \
    nix-instantiate '<nixpkgs>' -A hello && \
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager &&\
    nix-channel --update && \
    nix-shell '<home-manager>' -A install



# Set default command
CMD ["/bin/zsh"]
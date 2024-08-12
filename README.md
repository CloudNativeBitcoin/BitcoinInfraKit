# Bitcoin Infra Kit
cloud-native bitcoin infrastructure

## Container images

### btcd

Included from [btcsuite/btcd](https://github.com/btcsuite/btcd).

Building the image:

```shell
cd container-images/btcd

docker build -t bitcoininfrakit/btcd:v0.24.2 .
```

Running the image:

```shell
BTCD_DATA=/data/btcd

docker run -itd --rm --name=btcd \
  -p 8334:8334 \
  -v $BTCD_DATA:/data \
  bitcoininfrakit/btcd:v0.24.2
```

### mutinynet

Included from [MutinyWallet/mutiny-net](https://github.com/MutinyWallet/mutiny-net).

This is a custom build of `bitcoind` that runs a signet with 30-second
blocktime. It also has Covtools, CAT, and LNHANCE softforks activated.

Building the image:

```shell
cd container-images/mutinynet

docker build -t bitcoininfrakit/mutinynet:v27 .
```

Running the image:

```shell
docker run -itd --rm --name=mutinynet \
  -p 38332:38332 \
  bitcoininfrakit/mutinynet:v27
```

Connecting to the mutinynet bitcoind:

```shell
bitcoin-cli -rpcconnect=localhost:38332 \
  -rpcuser=bitcoin \
  -rpcpassword=bitcoin \
  getblockchain
```

---

## License

The project is licensed under the GNU Affero General Public License, except for
the following directories, which are under the indicated license. See LICENSE
file in each subfolder for detailed license agreement.

- container-images/[btcd](container-images/btcd): ISC License
- container-images/[mutinynet](container-images/mutinynet): MIT License

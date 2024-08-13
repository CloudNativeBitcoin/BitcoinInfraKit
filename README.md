# Bitcoin Infra Kit
cloud-native bitcoin infrastructure

## Container images

### btcd

Included from [btcsuite/btcd](https://github.com/btcsuite/btcd).

- Docker Hub: [bitcoininfrakit/btcd](https://hub.docker.com/u/bitcoininfrakit/btcd)
- Github: [cloudnativebitcoin/btcd](https://ghcr.io/cloudnativebitcoin/btcd) _SLSA v1 Build Level 3_

<details><summary>Building the image</summary>

```shell
cd container-images/btcd

docker build -t bitcoininfrakit/btcd:v0.24.2 .
```
</details>

<details><summary>Running the image</summary>

```shell
BTCD_DATA=/data/btcd

docker run -itd --rm --name=btcd \
  -p 8334:8334 \
  -v $BTCD_DATA:/data \
  bitcoininfrakit/btcd:v0.24.2
```
</details>

### mutinynet

Included from [MutinyWallet/mutiny-net](https://github.com/MutinyWallet/mutiny-net).

- Docker Hub: [bitcoininfrakit/mutinynet](https://hub.docker.com/u/bitcoininfrakit/mutinynet)
- Github: [cloudnativebitcoin/mutinynet](https://ghcr.io/cloudnativebitcoin/mutinynet) _SLSA v1 Build Level 3_

This is a custom build of `bitcoind` that runs a signet with 30-second
blocktime. It also has Covtools, CAT, and LNHANCE softforks activated.

<details><summary>Building the image</summary>

```shell
cd container-images/mutinynet

docker build -t bitcoininfrakit/mutinynet:v27 .
```
</details>

<details><summary>Running the image</summary>

```shell
docker run -itd --rm --name=mutinynet \
  -p 38332:38332 \
  bitcoininfrakit/mutinynet:v27
```
</details>

<details><summary>Connecting to mutinynet bitcoind</summary>

```shell
bitcoin-cli -rpcconnect=localhost:38332 \
  -rpcuser=bitcoin \
  -rpcpassword=bitcoin \
  getblockchain
```
</details>

---

## License

The project is licensed under the GNU Affero General Public License, except for
the following directories, which are under the indicated license. See LICENSE
file in each subfolder for detailed license agreement.

- container-images/[btcd](container-images/btcd): ISC License
- container-images/[mutinynet](container-images/mutinynet): MIT License

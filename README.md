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

---

## License

The project is licensed under the GNU Affero General Public License, except for
the following directories, which are under the indicated license. See LICENSE
file in each subfolder for detailed license agreement.

- container-images/[btcd](container-images/btcd): ISC License

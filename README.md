# Keep ECDSA Dappnode Package
This dappnode package will allow you to participate keep-network as a tBTC operator.

see:
- https://keep.network/
- https://discordapp.com/invite/wYezN7v (see 🥩Staking channels)

# Install
Access this link using your dappnode wifi:
http://my.dappnode/#/installer/%2Fipfs%2FQmYesbLMNBXBF2pvCQDNgifYFyezERraozQDuiV1HXPUEf

current ipfs hash `QmYesbLMNBXBF2pvCQDNgifYFyezERraozQDuiV1HXPUEf`

## Quick Start
1. Set `KEEP_ETHEREUM_PASSWORD` and `ANNOUNCED_ADDRESSES` environment variables in the Config section of the package.

ANNOUNCED_ADDRESSES should use the [libp2p multiaddr format](https://docs.libp2p.io/concepts/addressing/)
```
/ip4/255.255.255.255/tcp/3920
```

(Always use port 3920)

If announcing multiple addresses, the address should be listed as a comma-delimited string with no spaces or quotation marks, eg:
```
/ip4/255.255.255.255/tcp/3920,/dns4/my.dappnode.tech/tcp/3920
```

2. Copy operator address from package logs
3. GOTO https://dashboard.test.keep.network/
4. Delegate your keep tokens to the operator address
5. Authorize all 3 contracts (random beacon, ecdsa, tBTC)
6. Send the operator address some eth (0.001 eth is fine)


# Risk
see:
- https://hackmd.io/@protocollayer/BkUBl7zIw


## Collateralization



## Downtime / Unavaliability
> This means that if you are part of an active signing group, your node should never be down for more than two hours, since your group could be requested to redeem a deposit at any point.


## Backups
Losing your node's secret material is

The secret material is stored in to file path's on your Keep ECDSA Client Node:
- `/mnt/keystore/keep_wallet.json`
- `/mnt/persistence/`


## Extracting your operator account
The operator account is generated automatically for you when this package is initialized.
The operator account (ie private key) is stored in the data volume for this package,
so if you delete the dnp completely, including data, then you will lose your operator account.

It is a good idea to back up the account file / json someplace safe like a password manager.
The (encrypted) account is written to `/mnt/keystore/keep_wallet.json`.

To save this file, simply browse to the `File Manager` section of the DNP package and enter
this path into the `DOWNLOAD FILE FROM PACKAGE` input.

## Extracting you signing material

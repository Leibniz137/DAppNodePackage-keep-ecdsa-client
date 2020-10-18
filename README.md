# Keep ECDSA Dappnode Package
This dappnode package will allow you to participate keep-network as a tBTC operator.

see:
- https://keep.network/
- https://discordapp.com/invite/wYezN7v (see 🥩Staking channels)
- https://keep-network.gitbook.io/staking-documentation/

# Install
Access this link using your dappnode wifi:
http://my.dappnode/#/installer/%2Fipfs%2FQmeDQhVBmnZy8n4YGubQHQsshURMhcKArDbRWEYxn5SDMD

current ipfs hash `QmeDQhVBmnZy8n4YGubQHQsshURMhcKArDbRWEYxn5SDMD`

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
3. GOTO https://dashboard.keep.network/
4. Delegate your keep tokens to the operator address
5. Authorize the 2 application contracts (BondedECDSAKeepFactory, TBTCSystem)
6. Send the operator address some eth
  - ~0.5 eth is fine to start with, but be sure to monitor the balance!


# Risks
The primary risks in running a random beacon are downtime and loss of persistent data.

Educate yourself on the risks before attempting to operate a ecdsa client!

see:
- https://hackmd.io/@protocollayer/BkUBl7zIw
- https://keep-network.gitbook.io/staking-documentation/about-staking/slashing#tbtc-slashing-vectors
- https://github.com/keep-network/keep-core/blob/master/docs/status-reports/tbtc-2020-09-15-to-2020-10-13.adoc


## Under-Collateralization / Liquidation
Eth is bonded at a 150% collateralization ratio initially. This ratio cannot
be adjusted, and if it falls below 125%, you must close the deposit by market
buying tBTC.


## Downtime / Unavaliability
> This means that if you are part of an active signing group, your node should never be down for more than two hours, since your group could be requested to redeem a deposit at any point.


## Backups
Losing your node's secret material can cause loss of funds, including the BTC in the keeps you are participating in!

The secret material is stored in to file path's on your Keep ECDSA Client Node:
- `/mnt/keystore/keep_wallet.json`
- `/mnt/persistence/`


### Extracting your operator account
The operator account is generated automatically for you when this package is initialized.
The operator account (ie private key) is stored in the data volume for this package,
so if you delete the dnp completely, including data, then you will lose your operator account.

It is a good idea to back up the account file / json someplace safe like a password manager.
The (encrypted) account is written to `/mnt/keystore/keep_wallet.json`.

To save this file, simply browse to the `File Manager` section of the DNP package and enter
this path into the `DOWNLOAD FILE FROM PACKAGE` input.

### Extracting your signing material
The secret material corresponding to your share of keeps you are a member of is stored in `/mnt/persistence/`

This directory should be backed up every time you enter into a new keep.
Failure to properly back up this secret material can lead to BTC being permanently stuck in the keep,
and the loss of your bond.

[Don't be like this operator!](https://github.com/keep-network/keep-core/blob/master/docs/status-reports/tbtc-2020-09-15-to-2020-10-13.adoc#missing-signer-backups)

To save this directory, simply browse to the `File Manager` section of the DNP package and enter
this path into the `DOWNLOAD FILE FROM PACKAGE` input.

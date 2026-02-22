# PrivChain Public API Surface

Interface names only. No pre-release payload schemas or internals are disclosed in this file.

## Facilitator endpoints

- `POST /verify`
- `POST /settle`
- `GET /health`
- `GET /settlements/:settlementRef`
- `POST /reconcile`

## Payment scheme

- `priv-stark/v1`

## Protocol services

- `PrivChainProtocol`
- `PrivacyPoolService`
- `CommitmentService`
- `NullifierService`
- `ProofVerificationService`
- `SettlementService`
- `CompliancePolicyService`

## SDK and wallet surfaces

- `PrivClient`
- `PrivFacilitatorClient`
- `PrivWalletClient`
- `PrivPaymentSession`
- `PrivWallet`
- `SignerSession`
- `TransactionSigner`

## MCP surfaces

- `privchain_pay`
- `privchain_quote`
- `privchain_balance`
- `privchain_receipt`
- `privchain_health`

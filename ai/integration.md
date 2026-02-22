# PrivChain Integration Guidance (Public)

## Integration sequence

1. Start with API surface at https://privchain.io/api.html.
2. Align your payment flow with x402-compatible semantics.
3. Integrate verify and settle lifecycle behavior.
4. Add settlement lookup and reconciliation handling.
5. Add SDK and MCP tools for agent-native workflows.
6. Use early access funnel for onboarding: https://privchain.io/signup.html.

## Expected deployment model

- Production environments should use remote signer architecture.
- KMS/HSM-compatible key paths are preferred for operational security.
- Keep agent runtimes non-custodial and policy constrained.

## Public docs to pair with implementation

- Resources: https://privchain.io/resources.html
- Developers: https://privchain.io/developers.html
- FAQ: https://privchain.io/faq.html

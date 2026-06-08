# Square Verification & Payout Guide

This guide is designed to help you manage your Square account as we scale Instaweb. Following these steps will ensure your payments are processed smoothly and funds are transferred to your bank account without delay.

## 1. Confirming Your Square Account is Active

To ensure your account is ready to receive payments:
1. **Log in** to your [Square Dashboard](https://squareup.com/dashboard).
2. **Check the Home Screen**: Look for any red or yellow notification banners at the top of the page. Square will alert you here if they need more information or if your account is partially restricted.
3. **Verify Business Status**:
   - Go to **Account & Settings** (cog icon or your business name in the top navigation).
   - Under **Business Information**, click on **Verification**.
   - Ensure all sections are marked as "Verified" or "Completed."

## 2. Verifying Processed Payments

You can track both the $399 setup fees and the $248 monthly subscriptions in real-time:
1. Navigate to **Transactions** in the left-hand sidebar.
2. **Search and Filter**:
   - Use the **Date** filter to see today’s activity.
   - Use the **Amount** filter or search bar to look for specific values: `399.00` or `248.00`.
3. **Check Status**: Click on any transaction to see its details. A successful payment will show as **"Completed"**.
4. **Subscription Management**:
   - Go to **Payments** -> **Subscriptions** to see a list of active recurring plans and their next billing dates.

## 3. Setting Up and Verifying Bank Payouts

Funds collected by Square must be "transferred" to your linked bank account.
1. **Link Your Bank Account**:
   - Go to **Account & Settings** -> **Business Information** -> **Bank Accounts**.
   - Click **Add Bank Account**.
   - You can use **Instant Verification** (via Plaid) for immediate setup, or enter details manually.
2. **Manual Verification**:
   - If you enter details manually, Square will send two small deposits (under $1.00) to your account within 1-2 business days.
   - Once they appear, return to the **Bank Accounts** page and enter those amounts to verify.
3. **Set Your Payout Schedule**:
   - Go to **Balance** -> **Transfers** -> **Transfer Settings**.
   - **Daily (Automatic)** is recommended. Funds processed before the daily cut-off (usually 5 PM PT) will arrive in your bank account the next business day.

## 4. High-Volume Business Verification

As Instaweb scales rapidly, Square's risk algorithms may request additional verification to protect your account. This is normal for high-growth businesses.
1. **Watch for Requests**: Square may ask for:
   - **Proof of Service**: A copy of a contract or a link to a live customer website.
   - **Identity Verification**: A photo of a government-issued ID.
   - **Business License**: Documentation showing your business is legally registered.
2. **Submitting Documents**: 
   - Always submit these via the **Verification Center** in your Square Dashboard. 
   - **Do not** send sensitive documents via email.
3. **Action Required**: If you see a banner stating **"Payments on Hold,"** it usually means a document is pending review. Completing the request promptly is the fastest way to release funds.

---
*For technical support regarding payment link integration, please contact the Instaweb Tech Team.*

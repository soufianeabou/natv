# Register Bundle ID in Apple Developer Portal

## 🎯 Quick Fix for "Bundle ID Required" Error

The bundle ID `com.northafroca.tv` needs to be registered in Apple Developer Portal **BEFORE** you can use it in App Store Connect.

---

## 📋 Step-by-Step Instructions

### **STEP 1: Go to Apple Developer Portal**

1. Open: https://developer.apple.com/account
2. Sign in with your **Apple Developer account** (same account you used for App Store Connect)

### **STEP 2: Navigate to Certificates, Identifiers & Profiles**

1. In the left sidebar, click **"Certificates, Identifiers & Profiles"**
   - Or go directly to: https://developer.apple.com/account/resources/identifiers/list

### **STEP 3: Register New Bundle ID**

1. Click the **"+"** button (top left) to add a new identifier
2. Select **"App IDs"** → Click **"Continue"**
3. Select **"App"** → Click **"Continue"**

### **STEP 4: Enter Bundle ID Details**

Fill in the form:

- **Description**: `NA TV` (or any description you want)
- **Bundle ID**: 
  - Select **"Explicit"**
  - Enter: `com.northafroca.tv`
  - ⚠️ **MUST MATCH EXACTLY** - no spaces, no typos

### **STEP 5: Configure Capabilities (if needed)**

Enable any capabilities your app uses:
- ✅ **Push Notifications** (if you use Firebase Cloud Messaging)
- ✅ **Associated Domains** (if you use deep linking)
- ✅ **App Groups** (if needed)
- ✅ **In-App Purchase** (if you plan to sell content)

For now, you can leave most unchecked and add them later if needed.

### **STEP 6: Register**

1. Click **"Continue"**
2. Review the details
3. Click **"Register"**

---

## ✅ After Registration

1. **Wait 1-2 minutes** for the bundle ID to sync to App Store Connect
2. **Go back to App Store Connect** (refresh the page)
3. **Click the Bundle ID dropdown** in the "New App" dialog
4. **Select** `com.northafroca.tv` from the list
5. The error should disappear and the **"Create"** button will become enabled

---

## 🔍 Direct Links

- **Apple Developer Portal**: https://developer.apple.com/account
- **Identifiers List**: https://developer.apple.com/account/resources/identifiers/list
- **App Store Connect**: https://appstoreconnect.apple.com

---

## ⚠️ Important Notes

- Bundle ID is **case-sensitive**: `com.northafroca.tv` (lowercase)
- Once registered, it's **permanent** - you can't change it later
- Make sure it matches exactly what's in your Xcode project
- The bundle ID must be **unique** across all Apple apps

---

## 🎯 Quick Checklist

- [ ] Logged into Apple Developer Portal
- [ ] Navigated to Certificates, Identifiers & Profiles
- [ ] Clicked "+" to add new identifier
- [ ] Selected "App IDs" → "App"
- [ ] Entered Description: `NA TV`
- [ ] Entered Bundle ID: `com.northafroca.tv` (exact match)
- [ ] Clicked "Register"
- [ ] Waited 1-2 minutes
- [ ] Refreshed App Store Connect
- [ ] Selected bundle ID from dropdown
- [ ] Created the app!

---

**After registering, come back to App Store Connect and select the bundle ID from the dropdown!** 🚀


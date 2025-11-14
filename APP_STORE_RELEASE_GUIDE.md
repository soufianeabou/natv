# App Store Release Guide for NA TV

## 📋 Pre-Release Checklist

### ✅ Current Configuration
- **Bundle ID**: `com.northafroca.tv`
- **App Name**: NA TV
- **Version**: 1.0.0+8
- **Minimum iOS Version**: 14.0
- **Firebase**: Configured ✅

---

## 🚀 Step-by-Step Release Process

### **STEP 1: App Store Connect Setup**

1. **Login to App Store Connect**
   - Go to: https://appstoreconnect.apple.com
   - Sign in with your Apple Developer account

2. **Create New App**
   - Click **"My Apps"** → **"+"** → **"New App"**
   - Fill in:
     - **Platform**: iOS
     - **Name**: NA TV
     - **Primary Language**: Arabic (or your primary language)
     - **Bundle ID**: `com.northafroca.tv` (must match exactly)
     - **SKU**: `natv-001` (unique identifier, can be anything)
     - **User Access**: Full Access (or as needed)

3. **App Information**
   - **Category**: Entertainment / Media
   - **Subtitle**: (Optional) Short description
   - **Privacy Policy URL**: (Required) Your privacy policy link

---

### **STEP 2: Configure Code Signing in Xcode**

1. **Open Xcode Project**
   ```bash
   open ios/Runner.xcworkspace
   ```
   ⚠️ **IMPORTANT**: Open `.xcworkspace`, NOT `.xcodeproj`

2. **Select Runner Target**
   - In Xcode, select **Runner** project in left sidebar
   - Select **Runner** target
   - Go to **"Signing & Capabilities"** tab

3. **Enable Automatic Signing**
   - ✅ Check **"Automatically manage signing"**
   - Select your **Team** (your Apple Developer account)
   - Xcode will automatically:
     - Create/use App ID
     - Generate provisioning profiles
     - Configure certificates

4. **Verify Bundle Identifier**
   - Ensure it's exactly: `com.northafroca.tv`
   - Must match App Store Connect

---

### **STEP 3: Prepare App Store Listing**

In App Store Connect, fill out:

1. **App Information**
   - Name, subtitle, category
   - Privacy Policy URL (required)

2. **Pricing and Availability**
   - Set price (Free or Paid)
   - Select countries/regions

3. **App Privacy**
   - Answer privacy questions
   - Declare data collection practices

4. **Version Information**
   - **What's New**: Release notes (Arabic/English)
   - **Description**: App description
   - **Keywords**: Search keywords
   - **Support URL**: Your support website
   - **Marketing URL**: (Optional)

5. **App Screenshots**
   - Required sizes:
     - iPhone 6.7" (1290 x 2796 pixels) - 3 screenshots minimum
     - iPhone 6.5" (1242 x 2688 pixels) - 3 screenshots minimum
     - iPad Pro 12.9" (2048 x 2732 pixels) - Optional

6. **App Icon**
   - 1024 x 1024 pixels (no transparency, no rounded corners)
   - Already configured in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

---

### **STEP 4: Build iOS Archive**

#### **Option A: Using Xcode (Recommended)**

1. **Select Release Scheme**
   - In Xcode: **Product** → **Scheme** → **Runner**
   - **Product** → **Destination** → **Any iOS Device** (not simulator)

2. **Archive**
   - **Product** → **Archive**
   - Wait for build to complete (5-10 minutes)

3. **Distribute App**
   - In Organizer window, click **"Distribute App"**
   - Select **"App Store Connect"**
   - Select **"Upload"**
   - Follow wizard:
     - ✅ Automatically manage signing
     - ✅ Upload symbols (for crash reports)
     - Review and upload

#### **Option B: Using Flutter CLI**

```bash
# Clean build
flutter clean
cd ios
pod install
cd ..

# Build for release
flutter build ipa --release
```

The `.ipa` file will be in: `build/ios/ipa/`

Then upload via:
- **Xcode Organizer** → **Distribute App**
- **Transporter app** (from Mac App Store)
- **Command line**: `xcrun altool --upload-app`

---

### **STEP 5: Upload to App Store Connect**

1. **Wait for Processing**
   - After upload, Apple processes the build (10-30 minutes)
   - Check status in App Store Connect → **TestFlight** tab

2. **Select Build**
   - Go to your app version in App Store Connect
   - Under **"Build"**, click **"+"** to select your uploaded build

3. **Complete Version Information**
   - Fill all required fields
   - Add screenshots
   - Review all information

---

### **STEP 6: Submit for Review**

1. **Final Checks**
   - ✅ All required fields filled
   - ✅ Screenshots uploaded
   - ✅ Privacy policy URL added
   - ✅ App description complete
   - ✅ Build selected and processed

2. **Submit**
   - Click **"Submit for Review"**
   - Answer export compliance questions
   - Submit!

3. **Review Timeline**
   - Initial review: 24-48 hours
   - If rejected: Fix issues and resubmit
   - If approved: App goes live!

---

## 🔧 Troubleshooting

### **Code Signing Issues**
- Ensure you're logged into Xcode with your Apple Developer account
- Check Team selection in Signing & Capabilities
- Verify bundle ID matches App Store Connect

### **Build Errors**
- Run `flutter clean` and `pod install`
- Check iOS deployment target (currently 14.0)
- Verify all dependencies are compatible

### **Upload Failures**
- Check internet connection
- Verify Apple ID has proper permissions
- Try using Transporter app instead

---

## 📱 Required Assets Checklist

- [ ] App Icon (1024x1024) ✅ Already configured
- [ ] Screenshots (iPhone 6.7" - 3 minimum)
- [ ] Screenshots (iPhone 6.5" - 3 minimum)
- [ ] App Description (Arabic/English)
- [ ] Privacy Policy URL
- [ ] Support URL
- [ ] Keywords for search

---

## 🎯 Next Steps

1. **Open Xcode**: `open ios/Runner.xcworkspace`
2. **Configure Signing**: Enable automatic signing with your team
3. **Create App in App Store Connect**: Set up the app listing
4. **Build Archive**: Create release build
5. **Upload**: Distribute to App Store Connect
6. **Submit**: Complete listing and submit for review

---

## 📞 Support

If you encounter issues:
- Check Apple Developer documentation
- Review App Store Connect help
- Verify all certificates and provisioning profiles

**Good luck with your App Store release! 🚀**


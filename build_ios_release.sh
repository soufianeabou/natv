#!/bin/bash

# iOS App Store Release Build Script
# This script prepares and builds your iOS app for App Store submission

set -e

echo "🚀 Starting iOS Release Build Process..."
echo ""

# Set UTF-8 encoding
export LANG=en_US.UTF-8

# Step 1: Clean previous builds
echo "📦 Step 1: Cleaning previous builds..."
flutter clean

# Step 2: Get dependencies
echo "📦 Step 2: Getting Flutter dependencies..."
flutter pub get

# Step 3: Install CocoaPods
echo "📦 Step 3: Installing CocoaPods dependencies..."
cd ios
pod install
cd ..

# Step 4: Build IPA
echo "📦 Step 4: Building iOS Archive (IPA)..."
echo "⚠️  Note: This will create an .ipa file for App Store submission"
echo ""

flutter build ipa --release

echo ""
echo "✅ Build Complete!"
echo ""
echo "📱 Your .ipa file is located at:"
echo "   build/ios/ipa/na_tv.ipa"
echo ""
echo "📋 Next Steps:"
echo "   1. Open Xcode: open ios/Runner.xcworkspace"
echo "   2. Configure code signing in Signing & Capabilities"
echo "   3. Or upload the .ipa via Transporter app"
echo ""
echo "📖 See APP_STORE_RELEASE_GUIDE.md for detailed instructions"


#!/bin/bash

  ##############################################
  # Sage 9 Post-Deployment Script for Cloudways
  # File: post-deployment.sh
  ##############################################

  echo "====================================="
  echo "🚀 Starting Sage 9 Deployment Process"
  echo "====================================="

  # Get application details
  APP_PATH="/home/master/applications/$(basename $(pwd))/public_html"


  cd $APP_PATH

  echo "📍 Working Directory: $(pwd)"

  ##############################################
  # 1. CLEAR WORDPRESS CACHES
  ##############################################
  echo ""
  echo "🧹 Clearing WordPress Caches..."

  # Clear WordPress object cache (Redis/Memcached)
  if wp cache flush 2>/dev/null; then
      echo "✅ WordPress object cache cleared"
  else
      echo "⚠️  Object cache clear failed or not configured"
  fi

  # Clear transients
  wp transient delete --all  2>/dev/null
  echo "✅ Transients cleared"

  # Clear rewrite rules cache
  wp rewrite flush  2>/dev/null
  echo "✅ Rewrite rules flushed"


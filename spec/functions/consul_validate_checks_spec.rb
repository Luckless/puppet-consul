require 'spec_helper'

describe 'consul::validate_checks' do

  describe 'validate script and http' do
    it {should run.with_params([
      {
        'http'    => 'localhost',
        'script' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate script and tcp' do
    it {should run.with_params([
      {
        'tcp'    => 'localhost',
        'script' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate script and tls_skip_verify' do
    it {should run.with_params([
      {
        'tls_skip_verify' => 'true',
        'script' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate http and tcp' do
    it {should run.with_params([
      {
        'tcp'    => 'localhost',
        'http' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate script check' do
    it {should run.with_params([
      {
        'interval'    => '30s',
        'script' => 'true'
      }
    ])}
  end

  describe 'validate script missing interval' do
    it {should run.with_params([
      {
        'script' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate http missing interval' do
    it {should run.with_params([
      {
        'http' => 'localhost'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate tcp missing interval' do
    it {should run.with_params([
      {
        'tcp' => 'localhost'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate script and ttl' do
    it {should run.with_params([
      {
        'script' => 'true',
        'ttl' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate http and ttl' do
    it {should run.with_params([
      {
        'http' => 'localhost',
        'ttl' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate tcp and ttl' do
    it {should run.with_params([
      {
        'tcp' => 'localhost',
        'ttl' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate tcp and tls_skip_verify' do
    it {should run.with_params([
      {
        'tcp' => 'localhost',
        'tls_skip_verify' => 'true'
      }
    ]).and_raise_error(Exception) }
  end

  describe 'validate tcp check' do
    it {should run.with_params([
      {
        'tcp'      => 'localhost:80',
        'interval' => '30s',
      }
    ])}
  end

  describe 'validate http and tls_skip_verify' do
    it {should run.with_params([
      {
        'http' => 'localhost',
        'tls_skip_verify' => 'true'
      }
    ])}
  end

  describe 'validate http and ttl' do
    it {should run.with_params([
      {
        'http' => 'localhost',
        'ttl' => 'true'
      }
    ]).and_raise_error(Exception) }
  end
end

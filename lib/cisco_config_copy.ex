# Copyright © 2015 Jonathan Storm <the.jonathan.storm@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See the COPYING.WTFPL file for more details.

defmodule CiscoConfigCopy do
  @oid_ciscoConfigCopy "1.3.6.1.4.1.9.9.96"

  defp get_key_by_value(dict, value) do
    {k, _} = dict |> Enum.find(fn {_k, v} -> v == value end)

    k
  end

  @type configCopyProtocol :: 1..5
  def typeConfigCopyProtocol do
    %{
      tftp: 1,
      ftp: 2,
      rcp: 3,
      scp: 4,
      sftp: 5
    }
  end
  def typeConfigCopyProtocol(value) when is_atom(value) do
    typeConfigCopyProtocol[value]
  end
  def typeConfigCopyProtocol(value) when is_integer(value) do
    get_key_by_value(typeConfigCopyProtocol, value)
  end

  @type configFileType :: 1..6
  def typeConfigFileType do
    %{
      network_file: 1,
      ios_file: 2,
      startup_config: 3,
      running_config: 4,
      terminal: 5,
      fabric_startup_config: 6
    }
  end
  def typeConfigFileType(value) when is_atom(value) do
    typeConfigFileType[value]
  end
  def typeConfigFileType(value) when is_integer(value) do
    get_key_by_value(typeConfigFileType, value)
  end

  @type inetAddressType :: 0..4 | 16
  def typeInetAddressType do
    %{
      unknown: 0,
      ipv4: 1,
      ipv6: 2,
      ipv4z: 3,
      ipv6z: 4,
      dns: 16
    }
  end
  def typeInetAddressType(value) when is_atom(value) do
    typeInetAddressType[value]
  end
  def typeInetAddressType(value) when is_integer(value) do
    get_key_by_value(typeInetAddressType, value)
  end

  @type configCopyState :: 1..4
  def typeConfigCopyState do
    %{
      waiting: 1,
      running: 2,
      successful: 3,
      failed: 4
    }
  end
  def typeConfigCopyState(value) when is_atom(value) do
    typeConfigCopyState[value]
  end
  def typeConfigCopyState(value) when is_integer(value) do
    get_key_by_value(typeConfigCopyState, value)
  end

  @type configCopyFailCause :: 1..9
  def typeConfigCopyFailCause do
    %{
      unknown: 1,
      bad_file_name: 2,
      timeout: 3,
      no_mem: 4,
      no_config: 5,
      unsupported_protocol: 6,
      some_config_apply_failed: 7,
      system_not_ready: 8,
      request_aborted: 9
    }
  end
  def typeConfigCopyFailCause(value) when is_atom(value) do
    typeConfigCopyFailCause[value]
  end
  def typeConfigCopyFailCause(value) when is_integer(value) do
    get_key_by_value(typeConfigCopyFailCause, value)
  end

  @type rowStatus :: 1..6
  def typeRowStatus do
    %{
      active: 1,
      not_in_service: 2,
      not_ready: 3,
      create_and_go: 4,
      create_and_wait: 5,
      destroy: 6
    }
  end
  def typeRowStatus(value) when is_atom(value) do
    typeRowStatus[value]
  end
  def typeRowStatus(value) when is_integer(value) do
    get_key_by_value(typeRowStatus, value)
  end

  @type truthValue :: 1 | 2
  def typeTruthValue do
    %{
      true: 1,
      false: 2
    }
  end
  def typeTruthValue(value) when is_atom(value) do
    typeTruthValue[value]
  end
  def typeTruthValue(value) when is_integer(value) do
    get_key_by_value(typeTruthValue, value)
  end

  defmodule CcCopyEntry do
    @oid_ccCopyEntry                    "1.3.6.1.4.1.9.9.96.1.1.1.1"

    @oid_ccCopyProtocol                 {"#{@oid_ccCopyEntry}.2", :integer}
    @oid_ccCopySourceFileType           {"#{@oid_ccCopyEntry}.3", :integer}
    @oid_ccCopyDestFileType             {"#{@oid_ccCopyEntry}.4", :integer}
    @oid_ccCopyServerAddress            {"#{@oid_ccCopyEntry}.5", :octet_string}
    @oid_ccCopyFileName                 {"#{@oid_ccCopyEntry}.6", :octet_string}
    @oid_ccCopyUserName                 {"#{@oid_ccCopyEntry}.7", :octet_string}
    @oid_ccCopyUserPassword             {"#{@oid_ccCopyEntry}.8", :octet_string}
    @oid_ccCopyNotificationOnCompletion {"#{@oid_ccCopyEntry}.9", :integer}
    @oid_ccCopyState                    {"#{@oid_ccCopyEntry}.10", :integer}
    @oid_ccCopyTimeStarted              {"#{@oid_ccCopyEntry}.11", :octet_string}
    @oid_ccCopyTimeCompleted            {"#{@oid_ccCopyEntry}.12", :octet_string}
    @oid_ccCopyFailCause                {"#{@oid_ccCopyEntry}.13", :integer}
    @oid_ccCopyEntryRowStatus           {"#{@oid_ccCopyEntry}.14", :integer}
    @oid_ccCopyServerAddressType        {"#{@oid_ccCopyEntry}.15", :integer}
    @oid_ccCopyServerAddressRev1        {"#{@oid_ccCopyEntry}.16", :octet_string}

    defstruct [
      ccCopyProtocol: nil,
      ccCopySourceFileType: nil,
      ccCopyDestFileType: nil,
      ccCopyFileName: nil,
      ccCopyUserName: nil,
      ccCopyUserPassword: nil,
      ccCopyNotificationOnCompletion: nil,
      ccCopyState: nil,
      ccCopyTimeStarted: nil,
      ccCopyTimeCompleted: nil,
      ccCopyFailCause: nil,
      ccCopyEntryRowStatus: nil,
      ccCopyServerAddressType: nil,
      ccCopyServerAddressRev1: nil
    ]
    @type t :: %CcCopyEntry{
      ccCopyProtocol: CiscoConfigCopy.configCopyProtocol,
      ccCopySourceFileType: CiscoConfigCopy.configFileType,
      ccCopyDestFileType: CiscoConfigCopy.configFileType,
      ccCopyFileName: String.t,
      ccCopyUserName: String.t,
      ccCopyUserPassword: String.t,
      ccCopyNotificationOnCompletion: CiscoConfigCopy.truthValue,
      ccCopyState: CiscoConfigCopy.configCopyState,
      ccCopyTimeStarted: String.t,
      ccCopyTimeCompleted: String.t,
      ccCopyFailCause: CiscoConfigCopy.configCopyFailCause,
      ccCopyEntryRowStatus: CiscoConfigCopy.rowStatus,
      ccCopyServerAddressType: CiscoConfigCopy.inetAddressType,
      ccCopyServerAddressRev1: String.t
    }

    def ccCopyProtocol do
      ccCopyProtocol(%CcCopyEntry{})
    end
    def ccCopyProtocol(ccCopyEntry) do
      {oid, type} = @oid_ccCopyProtocol

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyProtocol)
    end
    def ccCopyProtocol(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeConfigCopyProtocol |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyProtocol: value}
    end

    def ccCopySourceFileType do
      ccCopySourceFileType(%CcCopyEntry{})
    end
    def ccCopySourceFileType(ccCopyEntry) do
      {oid, type} = @oid_ccCopySourceFileType

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopySourceFileType)
    end
    def ccCopySourceFileType(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeConfigFileType |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopySourceFileType: value}
    end

    def ccCopyDestFileType do
      ccCopyDestFileType(%CcCopyEntry{})
    end
    def ccCopyDestFileType(ccCopyEntry) do
      {oid, type} = @oid_ccCopyDestFileType

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyDestFileType)
    end
    def ccCopyDestFileType(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeConfigFileType |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyDestFileType: value}
    end

    def ccCopyFileName do
      ccCopyFileName(%CcCopyEntry{})
    end
    def ccCopyFileName(ccCopyEntry) do
      {oid, type} = @oid_ccCopyFileName

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyFileName)
    end
    def ccCopyFileName(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyFileName: value}
    end

    def ccCopyUserName do
      ccCopyUserName(%CcCopyEntry{})
    end
    def ccCopyUserName(ccCopyEntry) do
      {oid, type} = @oid_ccCopyUserName

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyUserName)
    end
    def ccCopyUserName(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyUserName: value}
    end

    def ccCopyUserPassword do
      ccCopyUserPassword(%CcCopyEntry{})
    end
    def ccCopyUserPassword(ccCopyEntry) do
      {oid, type} = @oid_ccCopyUserPassword

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyUserPassword)
    end
    def ccCopyUserPassword(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyUserPassword: value}
    end

    def ccCopyNotificationOnCompletion do
      ccCopyNotificationOnCompletion(%CcCopyEntry{})
    end
    def ccCopyNotificationOnCompletion(ccCopyEntry) do
      {oid, type} = @oid_ccCopyNotificationOnCompletion

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyNotificationOnCompletion)
    end
    def ccCopyNotificationOnCompletion(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeTruthValue |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyNotificationOnCompletion: value}
    end

    def ccCopyState do
      ccCopyState(%CcCopyEntry{})
    end
    def ccCopyState(ccCopyEntry) do
      {oid, type} = @oid_ccCopyState

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyState)
    end
    def ccCopyState(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeConfigCopyState |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyState: value}
    end

    def ccCopyTimeStarted do
      ccCopyTimeStarted(%CcCopyEntry{})
    end
    def ccCopyTimeStarted(ccCopyEntry) do
      {oid, type} = @oid_ccCopyTimeStarted

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyTimeStarted)
    end
    def ccCopyTimeStarted(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyTimeStarted: value}
    end

    def ccCopyTimeCompleted do
      ccCopyTimeCompleted(%CcCopyEntry{})
    end
    def ccCopyTimeCompleted(ccCopyEntry) do
      {oid, type} = @oid_ccCopyTimeCompleted

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyTimeCompleted)
    end
    def ccCopyTimeCompleted(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyTimeCompleted: value}
    end

    def ccCopyFailCause do
      ccCopyFailCause(%CcCopyEntry{})
    end
    def ccCopyFailCause(ccCopyEntry) do
      {oid, type} = @oid_ccCopyFailCause

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyFailCause)
    end
    def ccCopyFailCause(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeConfigCopyFailCause |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyFailCause: value}
    end

    def ccCopyEntryRowStatus do
      ccCopyEntryRowStatus(%CcCopyEntry{})
    end
    def ccCopyEntryRowStatus(ccCopyEntry) do
      {oid, type} = @oid_ccCopyEntryRowStatus

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyEntryRowStatus)
    end
    def ccCopyEntryRowStatus(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeRowStatus |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyEntryRowStatus: value}
    end

    def ccCopyServerAddressType do
      ccCopyServerAddressType(%CcCopyEntry{})
    end
    def ccCopyServerAddressType(ccCopyEntry) do
      {oid, type} = @oid_ccCopyServerAddressType

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyServerAddressType)
    end
    def ccCopyServerAddressType(ccCopyEntry, value) do
      value = CiscoConfigCopy.typeInetAddressType |> Map.fetch!(value)

      %CcCopyEntry{ccCopyEntry|ccCopyServerAddressType: value}
    end

    def ccCopyServerAddressRev1 do
      ccCopyServerAddressRev1(%CcCopyEntry{})
    end
    def ccCopyServerAddressRev1(ccCopyEntry) do
      {oid, type} = @oid_ccCopyServerAddressRev1

      SNMPMIB.object(oid, type, ccCopyEntry.ccCopyServerAddressRev1)
    end
    def ccCopyServerAddressRev1(ccCopyEntry, value) when is_binary(value) do
      %CcCopyEntry{ccCopyEntry|ccCopyServerAddressRev1: value}
    end
  end

  @spec cc_copy_entry(configCopyProtocol,
      configFileType, configFileType, String.t,
      inetAddressType, String.t) :: CcCopyEntry.t
  def cc_copy_entry(protocol,
      source_file_type, destination_file_type, filename,
      server_address_type, server_address) do
    %CcCopyEntry{}
    |> CcCopyEntry.ccCopyProtocol(protocol)
    |> CcCopyEntry.ccCopySourceFileType(source_file_type)
    |> CcCopyEntry.ccCopyDestFileType(destination_file_type)
    |> CcCopyEntry.ccCopyFileName(filename)
    |> CcCopyEntry.ccCopyServerAddressType(server_address_type)
    |> CcCopyEntry.ccCopyServerAddressRev1(server_address)
    |> CcCopyEntry.ccCopyEntryRowStatus(:active)
  end
  @spec cc_copy_entry(:running_config, :startup_config) :: CcCopyEntry.t
  def cc_copy_entry(:running_config, :startup_config) do
    %CcCopyEntry{}
    |> CcCopyEntry.ccCopyProtocol(:tftp)
    |> CcCopyEntry.ccCopySourceFileType(:running_config)
    |> CcCopyEntry.ccCopyDestFileType(:startup_config)
    |> CcCopyEntry.ccCopyFileName("")
    |> CcCopyEntry.ccCopyServerAddressType(:ipv4)
    |> CcCopyEntry.ccCopyServerAddressRev1("")
    |> CcCopyEntry.ccCopyEntryRowStatus(:active)
  end
  @spec cc_copy_entry(:startup_config, :running_config) :: CcCopyEntry.t
  def cc_copy_entry(:startup_config, :running_config) do
    %CcCopyEntry{}
    |> CcCopyEntry.ccCopySourceFileType(:startup_config)
    |> CcCopyEntry.ccCopyDestFileType(:running_config)
    |> CcCopyEntry.ccCopyFileName("")
    |> CcCopyEntry.ccCopyServerAddressType(:ipv4)
    |> CcCopyEntry.ccCopyServerAddressRev1("")
    |> CcCopyEntry.ccCopyEntryRowStatus(:active)
  end
end


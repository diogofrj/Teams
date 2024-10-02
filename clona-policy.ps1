# Verificando se a sessão está estabelecida
# if (-not (Get-PSSession | Where-Object { $_.ConfigurationName -eq 'MicrosoftTeams' })) {
#     Connect-MicrosoftTeams
# }
$globalPolicy = Get-CsTeamsMeetingPolicy -Identity Global

# Definindo variáveis
Write-Output "Definindo variáveis"
$policyName = "Policy-TranscriptionEnabled"
$policyDescription = "Policy-TranscriptionEnabled"
$usuariosEspecificos = @("leonardo.freitas@fortbrasil.com.br", "diogo.souza@fortbrasil.com.br", "marcos.carvalho@fortbrasil.com.br")
$AllowTranscription = $True

Write-Output "Criando a Politica $policyName - $policyDescription"
New-CsTeamsMeetingPolicy -Identity $policyName -Description $policyDescription `
    -AllowChannelMeetingScheduling $globalPolicy.AllowChannelMeetingScheduling `
    -AllowMeetNow $globalPolicy.AllowMeetNow `
    -AllowPrivateMeetNow $globalPolicy.AllowPrivateMeetNow `
    -MeetingChatEnabledType $globalPolicy.MeetingChatEnabledType `
    -AllowExternalNonTrustedMeetingChat $globalPolicy.AllowExternalNonTrustedMeetingChat `
    -CopyRestriction $globalPolicy.CopyRestriction `
    -LiveCaptionsEnabledType $globalPolicy.LiveCaptionsEnabledType `
    -DesignatedPresenterRoleMode $globalPolicy.DesignatedPresenterRoleMode `
    -AllowIPAudio $globalPolicy.AllowIPAudio `
    -AllowIPVideo $globalPolicy.AllowIPVideo `
    -AllowEngagementReport $globalPolicy.AllowEngagementReport `
    -AllowTrackingInReport $globalPolicy.AllowTrackingInReport `
    -IPAudioMode $globalPolicy.IPAudioMode `
    -IPVideoMode $globalPolicy.IPVideoMode `
    -AllowAnonymousUsersToDialOut $globalPolicy.AllowAnonymousUsersToDialOut `
    -AllowAnonymousUsersToStartMeeting $globalPolicy.AllowAnonymousUsersToStartMeeting `
    -AllowAnonymousUsersToJoinMeeting $globalPolicy.AllowAnonymousUsersToJoinMeeting `
    -BlockedAnonymousJoinClientTypes $globalPolicy.BlockedAnonymousJoinClientTypes `
    -AllowedStreamingMediaInput $globalPolicy.AllowedStreamingMediaInput `
    -ExplicitRecordingConsent $globalPolicy.ExplicitRecordingConsent `
    -AllowLocalRecording $globalPolicy.AllowLocalRecording `
    -AutoRecording $globalPolicy.AutoRecording `
    -ParticipantNameChange $globalPolicy.ParticipantNameChange `
    -AllowPrivateMeetingScheduling $globalPolicy.AllowPrivateMeetingScheduling `
    -AutoAdmittedUsers $globalPolicy.AutoAdmittedUsers `
    -AllowCloudRecording $globalPolicy.AllowCloudRecording `
    -AllowRecordingStorageOutsideRegion $globalPolicy.AllowRecordingStorageOutsideRegion `
    -RecordingStorageMode $globalPolicy.RecordingStorageMode `
    -AllowOutlookAddIn $globalPolicy.AllowOutlookAddIn `
    -AllowPowerPointSharing $globalPolicy.AllowPowerPointSharing `
    -AllowParticipantGiveRequestControl $globalPolicy.AllowParticipantGiveRequestControl `
    -AllowExternalParticipantGiveRequestControl $globalPolicy.AllowExternalParticipantGiveRequestControl `
    -AllowSharedNotes $globalPolicy.AllowSharedNotes `
    -AllowWhiteboard $globalPolicy.AllowWhiteboard `
    -AllowTranscription $globalPolicy.AllowTranscription `
    -AllowNetworkConfigurationSettingsLookup $globalPolicy.AllowNetworkConfigurationSettingsLookup `
    -MediaBitRateKb $globalPolicy.MediaBitRateKb `
    -ScreenSharingMode $globalPolicy.ScreenSharingMode `
    -VideoFiltersMode $globalPolicy.VideoFiltersMode `
    -AllowPSTNUsersToBypassLobby $globalPolicy.AllowPSTNUsersToBypassLobby `
    -AllowOrganizersToOverrideLobbySettings $globalPolicy.AllowOrganizersToOverrideLobbySettings `
    -PreferredMeetingProviderForIslandsMode $globalPolicy.PreferredMeetingProviderForIslandsMode `
    -AllowNDIStreaming $globalPolicy.AllowNDIStreaming `
    -SpeakerAttributionMode $globalPolicy.SpeakerAttributionMode `
    -EnrollUserOverride $globalPolicy.EnrollUserOverride `
    -RoomAttributeUserOverride $globalPolicy.RoomAttributeUserOverride `
    -StreamingAttendeeMode $globalPolicy.StreamingAttendeeMode `
    -AttendeeIdentityMasking $globalPolicy.AttendeeIdentityMasking `
    -AllowBreakoutRooms $globalPolicy.AllowBreakoutRooms `
    -TeamsCameraFarEndPTZMode $globalPolicy.TeamsCameraFarEndPTZMode `
    -AllowMeetingReactions $globalPolicy.AllowMeetingReactions `
    -AllowMeetingRegistration $globalPolicy.AllowMeetingRegistration `
    -WhoCanRegister $globalPolicy.WhoCanRegister `
    -AllowScreenContentDigitization $globalPolicy.AllowScreenContentDigitization `
    -AllowCarbonSummary $globalPolicy.AllowCarbonSummary `
    -RoomPeopleNameUserOverride $globalPolicy.RoomPeopleNameUserOverride `
    -AllowMeetingCoach $globalPolicy.AllowMeetingCoach `
    -NewMeetingRecordingExpirationDays $globalPolicy.NewMeetingRecordingExpirationDays `
    -LiveStreamingMode $globalPolicy.LiveStreamingMode `
    -MeetingInviteLanguages $globalPolicy.MeetingInviteLanguages `
    -ChannelRecordingDownload $globalPolicy.ChannelRecordingDownload `
    -AllowCartCaptionsScheduling $globalPolicy.AllowCartCaptionsScheduling `
    -AllowTasksFromTranscript $globalPolicy.AllowTasksFromTranscript `
    -InfoShownInReportMode $globalPolicy.InfoShownInReportMode `
    -LiveInterpretationEnabledType $globalPolicy.LiveInterpretationEnabledType `
    -QnAEngagementMode $globalPolicy.QnAEngagementMode `
    -AllowImmersiveView $globalPolicy.AllowImmersiveView `
    -AllowAvatarsInGallery $globalPolicy.AllowAvatarsInGallery `
    -AllowAnnotations $globalPolicy.AllowAnnotations `
    -AllowDocumentCollaboration $globalPolicy.AllowDocumentCollaboration `
    -AllowWatermarkForScreenSharing $globalPolicy.AllowWatermarkForScreenSharing `
    -AllowWatermarkForCameraVideo $globalPolicy.AllowWatermarkForCameraVideo `
    -AllowWatermarkCustomizationForCameraVideo $globalPolicy.AllowWatermarkCustomizationForCameraVideo `
    -WatermarkForCameraVideoOpacity $globalPolicy.WatermarkForCameraVideoOpacity `
    -WatermarkForCameraVideoPattern $globalPolicy.WatermarkForCameraVideoPattern `
    -AllowWatermarkCustomizationForScreenSharing $globalPolicy.AllowWatermarkCustomizationForScreenSharing `
    -WatermarkForScreenSharingOpacity $globalPolicy.WatermarkForScreenSharingOpacity `
    -WatermarkForScreenSharingPattern $globalPolicy.WatermarkForScreenSharingPattern `
    -AllowWatermarkCustomizationForScreenSharing $globalPolicy.AllowWatermarkCustomizationForScreenSharing `
    -WatermarkForAnonymousUsers $globalPolicy.WatermarkForAnonymousUsers `
    -DetectSensitiveContentDuringScreenSharing $globalPolicy.DetectSensitiveContentDuringScreenSharing `
    -AudibleRecordingNotification $globalPolicy.AudibleRecordingNotification `
    -ConnectToMeetingControls $globalPolicy.ConnectToMeetingControls `
    -Copilot $globalPolicy.Copilot `
    -AutomaticallyStartCopilot $globalPolicy.AutomaticallyStartCopilot `
    -VoiceIsolation $globalPolicy.VoiceIsolation `
    -ExternalMeetingJoin $globalPolicy.ExternalMeetingJoin `
    -ContentSharingInExternalMeetings $globalPolicy.ContentSharingInExternalMeetings `
    -AllowedUsersForMeetingContext $globalPolicy.AllowedUsersForMeetingContext `
    -SmsNotifications $globalPolicy.SmsNotifications `
    -CaptchaVerificationForMeetingJoin $globalPolicy.CaptchaVerificationForMeetingJoin `
    -UsersCanAdmitFromLobby $globalPolicy.UsersCanAdmitFromLobby 
    
# Aplicando a política aos usuários específicos
Write-Output "Aplicando a politica aos usuarios especificos: $usuariosEspecificos"
foreach ($usuario in $usuariosEspecificos) {
    Grant-CsTeamsMeetingPolicy -Identity $usuario -PolicyName $policyName
}

Write-Output "Aplicando os parametros personalizados para a politica $policyName"
Set-CsTeamsMeetingPolicy -Identity $policyName -AllowTranscription $AllowTranscription

Write-Output "Politica $policyName criada com sucesso"
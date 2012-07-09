#tag Class
Protected Class Session
Inherits WebSession
	#tag ViewBehavior
		#tag ViewProperty
			Name="ActiveConnectionCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffset"
			Group="Behavior"
			Type="Double"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HashTag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Protocol"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="WebSession"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Expiration"
			Group="Behavior"
			InitialValue="-1"
			Type="Double"
			InheritedFrom="WebSession"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

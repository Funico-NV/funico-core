//
//  SwiftSMTP+Convenience.swift
//  funico-core
//
//  Created by Damian Van de Kauter on 11/03/2026.
//

#if canImport(SwiftSMTP)
import SwiftSMTP

#if canImport(SwiftHTML)
import SwiftHTML
#endif

public extension SwiftSMTP.Mail {
    
    static func error(
        _ error: Error, project: String,
        from sender: Contact, to receivers: Contact...,
        cc: Receivers? = nil, bcc: Receivers? = nil,
        severity: Severity = .critical
    ) -> Self {
        #if canImport(SwiftHTML)
        var mail = .init(
            from: sender, to: receivers, cc: cc, bcc: bcc,
            subject: "[\(project)] Foutmelding") {
                HTMLDocument {
                    Grid(role: .presentation, width: "100%", cellpadding: 0, cellspacing: 0, border: 0) {
                        GridRow {
                            GridCell(alignment: .center, attributes: ["style": "padding: 32px 16px;"]) {
                                Grid(role: .presentation, width: "600", cellpadding: 0, cellspacing: 0, border: 0) {
                                    GridRow {
                                        GridCell(attributes: [
                                            "style": "background: #FFFFFF; border: 1px solid #E6E8EF; border-radius: 16px; padding: 28px;"
                                        ]) {
                                            Text("\(project) foutmelding:")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.hex("#1F2A44"))
                                            
                                            Spacer(height: 8)
                                            
                                            Text("Er is een fout opgetreden.")
                                                .font(.body)
                                                .foregroundColor(.hex("#3D4B66"))
                                            
                                            Spacer(height: 20)
                                            
                                            Div {
                                                Text("Foutdetails:")
                                                    .font(.caption)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.hex("#6B7385"))
                                                
                                                Spacer(height: 6)
                                                
                                                Text(error.localizedDescription)
                                                    .font(.body)
                                                    .foregroundColor(.hex("#B42318"))
                                                    .style(
                                                        .background("#FFF5F5"),
                                                        .padding("12px"),
                                                        .border("1px solid #F2B8B5"),
                                                        .borderRadius("10px")
                                                    )
                                            }
                                            
                                            Spacer(height: 50)
                                            
                                            Text("Als dit probleem zich blijft voordoen, neem dan contact op met de ontwikkelaar.")
                                                .font(.body)
                                                .foregroundColor(.hex("#3D4B66"))
                                            
                                            Spacer(height: 16)
                                            
                                            Text("Bedankt,")
                                                .font(.body)
                                                .foregroundColor(.hex("#3D4B66"))
                                            
                                            Text("Team Funico")
                                                .font(.body)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.hex("#1F2A44"))
                                            
                                            Spacer(height: 30)
                                        }
                                    }
                                }
                                .style(.width("100%"), .maxWidth("600px"))
                            }
                        }
                    }
                } head: {
                    Meta(.charset("utf-8"))
                    Meta(.name("viewport", content: "width=device-width, initial-scale=1"))
                    Title(project)
                }
                .language("nl")
                .style(.margin("0"), .padding("0"), .background("#F4F6FA"), .fontFamily("-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif"))
            }
        mail.setPriority((severity == .critical) ? .high : .normal)
        
        return mail
        #else
        var mail = .init(
            from: sender, to: receivers, cc: cc, bcc: bcc,
            subject: project, text: """
            \(project) Error
            
            Er is een fout opgetreden.
                            
            Foutdetails:
            \(error.localizedDescription)
            """)
        mail.setPriority((severity == .critical) ? .high : .normal)
        
        return mail
        #endif
    }
}
#endif
